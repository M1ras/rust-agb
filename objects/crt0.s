.text // Mark everything as text
.global _start // Mark _start as global for the linker
.arm // Put the CPU in 32 bit mode (code32),
     // as opposed to 16 bit mode (code16/thumb)

// ┌───────────────────────────────────────────────────────────────────────────┐
// │ ROM Registration Data                                                     │
// │ See Section 18 of the AGB Programming Manual                              │
// └───────────────────────────────────────────────────────────────────────────┘
_start:
  // Start Address
  // 8000000h - 8000003h
  b start_user_program

  // Nintendo Logo CHaracter Data
  // 8000004h ~ 800009Fh
  //
  // This must be exactly this, or the game won't boot
  .byte 0x24,0xff,0xae,0x51,0x69,0x9a,0xa2,0x21
  .byte 0x3d,0x84,0x82,0x0a,0x84,0xe4,0x09,0xad
  .byte 0x11,0x24,0x8b,0x98,0xc0,0x81,0x7f,0x21
  .byte 0xa3,0x52,0xbe,0x19,0x93,0x09,0xce,0x20
  .byte 0x10,0x46,0x4a,0x4a,0xf8,0x27,0x31,0xec
  .byte 0x58,0xc7,0xe8,0x33,0x82,0xe3,0xce,0xbf
  .byte 0x85,0xf4,0xdf,0x94,0xce,0x4b,0x09,0xc1
  .byte 0x94,0x56,0x8a,0xc0,0x13,0x72,0xa7,0xfc
  .byte 0x9f,0x84,0x4d,0x73,0xa3,0xca,0x9a,0x61
  .byte 0x58,0x97,0xa3,0x27,0xfc,0x03,0x98,0x76
  .byte 0x23,0x1d,0xc7,0x61,0x03,0x04,0xae,0x56
  .byte 0xbf,0x38,0x84,0x00,0x40,0xa7,0x0e,0xfd
  .byte 0xff,0x52,0xfe,0x03,0x6f,0x95,0x30,0xf1
  .byte 0x97,0xfb,0xc0,0x85,0x60,0xd6,0x80,0x25
  .byte 0xa9,0x63,0xbe,0x03,0x01,0x4e,0x38,0xe2
  .byte 0xf9,0xa2,0x34,0xff,0xbb,0x3e,0x03,0x44
  .byte 0x78,0x00,0x90,0xcb,0x88,0x11,0x3a,0x94
  .byte 0x65,0xc0,0x7c,0x63,0x87,0xf0,0x3c,0xaf
  .byte 0xd6,0x25,0xe4,0x8b,0x38,0x0a,0xac,0x72
  .byte 0x21,0xd4,0xf8,0x07

  // Game Title
  // 80000A0h - 80000ABh
  //
  // Up to 12 ASCII characters, leave extra characters as 0x00
  .byte 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
  .byte 0x00,0x00,0x00,0x00

  // Game Code
  // 80000ACh - 80000AFh
  //
  // 4 ASCII characters: an AGB-UTTD code as found on a game box and cartridge
  // - 1st Character (U): Unique Code
  //   - "A": Normal Games (2001 - 2003)
  //   - "B": Normal Games (2003 - Current)
  //   - "C": Normal Games (Never Used)
  //   - "F": Famicom/Classic NES Series Games
  //   - "K": Games with an Acceleration Sensor
  //   - "P": Nintendo e-Reader
  //   - "R": Games with Rumble and a Z-Axis Gyroscope
  //   - "U": Games with RTC and a Solar Sensor
  //   - "V": Games with Rumble
  //   - ...
  //
  // - 2nd & 3rd Character (TT): Short Title
  // - 4th Character (D): Region/Language
  //   - "D": Germany/German
  //   - "E": USA/English
  //   - "F": France/French
  //   - "I": Italy/Italian
  //   - "J": Japan/Japanese
  //   - "P": Europe/Everywhere Else
  //   - "S": Spain/Spanish
  //   - ...
  .byte 0x00,0x00,0x00,0x00
  
  // Maker Code
  // 80000B0h - 80000B1h
  //
  // 2 ASCII characters
  //   - "01": Nintendo
  //   - ...
  .byte 0x00,0x00

  // 96h
  // 80000B2h
  //
  // This must be exactly 0x96, or the game won't boot
  .byte 0x96

  // Main Unit Code
  // 80000B3h
  //
  // - 0x00: AGB-001, AGS-001, AGS-101, and OXY-001
  .byte 0x00

  // Device Type
  // 80000B4h
  //
  // - 0x00: Production
  // - 0x80: Development
  .byte 0x80

  // Reserved Area
  // 80000B5h - 80000BBh
  .fill 7,1,0

  // Mask ROM Version No.
  // 80000BCh
  .byte 0x00

  // Complement Check
  // 80000BDh
  .byte 0x51

  // Reserved Area
  // 80000BEh - 80000BFh
  .fill 2,1,0


// ┌───────────────────────────────────────────────────────────────────────────┐
// │ Start User Program                                                        │
// └───────────────────────────────────────────────────────────────────────────┘
start_user_program:
  ldr r0,=main // Load main into Register 0
  bx r0 // Branch & Execute Register 0
