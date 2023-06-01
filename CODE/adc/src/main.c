/*
 * Copyright (c) 2020 Libre Solar Technologies GmbH
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include <inttypes.h>
#include <stddef.h>
#include <stdint.h>

#include <zephyr/device.h>
#include <zephyr/devicetree.h>
#include <zephyr/drivers/adc.h>
#include <zephyr/drivers/gpio.h>
#include <zephyr/kernel.h>
#include <zephyr/sys/printk.h>
#include <zephyr/sys/util.h>

#if !DT_NODE_EXISTS(DT_PATH(zephyr_user)) || \
	!DT_NODE_HAS_PROP(DT_PATH(zephyr_user), io_channels)
#error "No suitable devicetree overlay specified"
#endif

#define DT_SPEC_AND_COMMA(node_id, prop, idx) \
	ADC_DT_SPEC_GET_BY_IDX(node_id, idx),

#define DRIVE_NODE DT_ALIAS(fetenbl)
static const struct gpio_dt_spec drive = GPIO_DT_SPEC_GET(DRIVE_NODE, gpios);

#define NTC_NODE DT_ALIAS(ntcenbl)
static const struct gpio_dt_spec ntc = GPIO_DT_SPEC_GET(NTC_NODE, gpios);

/* Data of ADC io-channels specified in devicetree. */
static const struct adc_dt_spec adc_channels[] = {
	DT_FOREACH_PROP_ELEM(DT_PATH(zephyr_user), io_channels,
			     DT_SPEC_AND_COMMA)
};

void main(void)
{
	int err;
	int16_t buf;
	struct adc_sequence sequence = {
		.buffer = &buf,
		/* buffer size in bytes, not number of samples */
		.buffer_size = sizeof(buf),
	};

	/* Configure channels individually prior to sampling. */
	for (size_t i = 0U; i < ARRAY_SIZE(adc_channels); i++) {
		if (!device_is_ready(adc_channels[i].dev)) {
			printk("ADC controller device not ready\n");
			return;
		}

		err = adc_channel_setup_dt(&adc_channels[i]);
		if (err < 0) {
			printk("Could not setup channel #%d (%d)\n", i, err);
			return;
		}
	}

	int count = 0;

	int ret;
	if (!device_is_ready(ntc.port)) {
		return;
	}
	
	ret = gpio_pin_configure_dt(&ntc, GPIO_OUTPUT_ACTIVE);
	if (ret < 0) {
		return;
	}


	int ret2;
	if (!device_is_ready(drive.port)) {
		return;
	}
	
	ret2 = gpio_pin_configure_dt(&drive, GPIO_OUTPUT_ACTIVE);
	if (ret2 < 0) {
		return;
	}



	while (1) {
		printk("ADC reading: ");
		for (size_t i = 0U; i < ARRAY_SIZE(adc_channels); i++) {
			int32_t val_mv;

			printk("- %s, channel %d: ",
			       adc_channels[i].dev->name,
			       adc_channels[i].channel_id);

			(void)adc_sequence_init_dt(&adc_channels[i], &sequence);

			err = adc_read(adc_channels[i].dev, &sequence);
			if (err < 0) {
				printk("Could not read (%d) ", err);
				continue;
			} else {
				printk("%"PRId16, buf);
			}

			/* conversion to mV may not be supported, skip if not */
			val_mv = buf;
			err = adc_raw_to_millivolts_dt(&adc_channels[i],
						       &val_mv);
			if (err < 0) {
				printk(" (value in mV not available) ");
			} else {
				printk(" = %"PRId32" mV", val_mv);
			}
		}
		printk("\r\n");
		count++;
		if(count % 10 == 0){
			ret = gpio_pin_toggle_dt(&ntc);
			if (ret < 0) {
				return;
			}
		}
		if(count % 10 == 0){
			ret = gpio_pin_toggle_dt(&drive);
			if (ret < 0) {
				return;
			}
		}
		k_sleep(K_MSEC(100));
	}
}
