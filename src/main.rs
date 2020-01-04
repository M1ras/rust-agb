#![no_std]
#![feature(start)]

use core::panic::PanicInfo;

#[panic_handler]
fn panic(_info: &PanicInfo) -> ! {
  loop {}
}

#[start]
fn main(_argc: isize, _argv: *const *const u8) -> isize {
  unsafe {
    let _max_x: isize = 239;
    let _max_y: isize = 159;

    let mut _x: isize = _max_x / 2;
    let mut _y: isize = _max_y / 2;
    let mut _color: u16 = 0x001F;

    (0x400_0000 as *mut u16).write_volatile(0x0403);
    (0x600_0000 as *mut u16).offset(_y * 240 + _x).write_volatile(_color);

    _x = _x + 1;
    _color = 0x03E0;
    (0x600_0000 as *mut u16).offset(_y * 240 + _x).write_volatile(_color);

    _x = _x + 1;
    _color = 0x7C00;
    (0x600_0000 as *mut u16).offset(_y * 240 + _x).write_volatile(_color);

    loop {}
  }
}
