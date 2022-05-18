OUTPUT("binary")
ENTRY("_start")
SECTIONS
{
  .= 0x10000
  .text = { (*.text) }
  .data = { (*.data) }
  .rodata = {(*.data) }
}
