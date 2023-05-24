//! Board support crate for the Nordic nRF52840-DK
//!
//! UARTE, SPIM and TWI should be functional,
//! but might miss some features.
#![no_std]

pub use cortex_m;
pub use embedded_hal;
pub use nrf52840_hal as hal;

/// Exports traits that are usually needed when using this crate
pub mod prelude {
    pub use nrf52840_hal::prelude::*;
}

// TODO: Maybe we want a debug module like in the DWM1001-Dev implementation.
// pub mod debug;

use nrf52840_hal::{
    gpio::{p0, p1, Disconnected, Input, Level, Output, Pin, PullUp, PushPull},
    pac::{self as nrf52, CorePeripherals, Peripherals},
};

use embedded_hal::digital::v2::{InputPin, OutputPin};

/// Provides access to all features of the nRF52840-DK board
#[allow(non_snake_case)]
pub struct Board {
    /// The nRF52's pins which are not otherwise occupied on the nRF52840-DK
    pub pins: Pins,
    ///Oscillator controller pins
    pub oscs: Oscs,
    /// nRF52 peripheral: TIMER0
    pub TIMER0: nrf52::TIMER0,
}

impl Board {
    /// Take the peripherals safely
    ///
    /// This method will return an instance of `nRF52840DK` the first time it is
    /// called. It will return only `None` on subsequent calls.
    pub fn take() -> Option<Self> {
        Some(Self::new(CorePeripherals::take()?, Peripherals::take()?))
    }

    pub unsafe fn steal() -> Self {
        Self::new(CorePeripherals::steal(), Peripherals::steal())
    }

    fn new(cp: CorePeripherals, p: Peripherals) -> Self {
        let pins0 = p0::Parts::new(p.P0);
        let pins1 = p1::Parts::new(p.P1);
        // The nRF52840-DK features an USB CDC port.
        // It features HWFC but does not have to use it.
        // It can transmit a flexible baudrate of up to 1Mbps.

        Board {
            pins: Pins {
                P0_13: pins0.p0_13,
                P0_20: pins0.p0_20,
                _RESET: pins0.p0_18,
            },
            oscs: Oscs{
                Osc_pow: Oscpin::new(pins0.p0_26.degrade()),
                Osc_enbl: Oscpin::new(pins0.p0_09.degrade())
            },
            TIMER0: p.TIMER0,
        }
    }
}

/// The nRF52 pins that are available on the nRF52840DK
#[allow(non_snake_case)]
pub struct Pins {
    pub P0_13: p0::P0_13<Disconnected>,
    pub P0_20: p0::P0_20<Disconnected>,
    _RESET: p0::P0_18<Disconnected>,
}

/// The LEDs on the nRF52840-DK board
pub struct Oscs {
    /// nRF52840-DK: LED1, nRF52: P0.30
    pub Osc_pow: Oscpin,
    /// nRF52840-DK: LED2, nRF52: P0.31
    pub Osc_enbl: Oscpin,
}
pub struct Oscpin(Pin<Output<PushPull>>);

impl Oscpin{
    fn new<Mode>(pin: Pin<Mode>) -> Self {
        Oscpin(pin.into_push_pull_output(Level::Low))
    }

    /// Release the inner Pin to be used directly
    pub fn release(self) -> Pin<Output<PushPull>> {
        self.0
    }

    /// Enable the LED
    pub fn enable(&mut self) {
        self.0.set_low().unwrap()
    }

    /// Disable the LED
    pub fn disable(&mut self) {
        self.0.set_high().unwrap()
    }
}