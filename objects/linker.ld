/* AGB Memory
 * See Section 3.1 of the AGB Programming Manual
 */
MEMORY {

  /* CPU External Working RAM
   * 02000000h - 0203FFFFh
   */
  ewram (w!x) : ORIGIN = 0x2000000, LENGTH = 256K

  /* CPU Internal Working RAM
   * 03000000h - 03007FFFh
   */
  iwram (w!x) : ORIGIN = 0x3000000, LENGTH = 32K

  /* Game Pak ROM
   * 08000000h - 09FFFFFFh
   */
  rom (rx) : ORIGIN = 0x8000000, LENGTH = 32M
}

/* AGB ROM
 *
 * TODO: Write Documentation
 */
SECTIONS {
  
  /* Text Section
   * 
   * TODO: Write Documentation
   */
  .text : {
    KEEP(target/crt0.o(.text))
    *(.text .text.*)
    . = ALIGN(4);
  } > rom

  /* Read Only Data Section
   *
   * TODO: Write Documentation
   */
  .rodata : {
    *(.rodata .rodata.*)
    . = ALIGN(4);
  } > rom

  /* Data Section
   *
   * TODO: Write Documentation
   */
  .data : {
    *(.data .data.*)
    . = ALIGN(4);
  } > iwram

  /* BSS Section
   *
   * TODO: Write Documentation
   */
  .bss : {
    *(.bss .bss.*)
    . = ALIGN(4);
  } > iwram

  /* Discard extra sections */
  /DISCARD/ : {
    *(*)
  }
}
