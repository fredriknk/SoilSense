#![no_main]
#![no_std]

use cortex_m_rt::entry;
use nb::block;

use panic_halt as _;

use nrf52840_dk_bsp::{
    hal::{
        prelude::*,
        timer::{self, Timer},
    },
    Board,
};

use rtt_target::{rprintln, rtt_init_print};

#[entry]
fn main() -> ! {
    rtt_init_print!();
    // Print a message over RTT
    rprintln!("Initialize");
    
    let mut nrf52 = Board::take().unwrap();

    let mut timer = Timer::new(nrf52.TIMER0);
    rprintln!("Started timers");

    // Alternately flash the red and blue leds
    loop {
        rprintln!("LED1");
        nrf52.leds.led_2.enable();
        delay(&mut timer, 1_000_000); // 250ms
        rprintln!("LED2");
        nrf52.leds.led_2.disable();
        delay(&mut timer, 1_000_000); // 1s
    }
}

fn delay<T>(timer: &mut Timer<T>, cycles: u32)
where
    T: timer::Instance,
{
    timer.start(cycles);
    let _ = block!(timer.wait());
}
