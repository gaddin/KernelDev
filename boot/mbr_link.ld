OUTPUT("binary")

SECTIONS
{
  .= 0x10000
  
  .text = { (*.text) }
  .data = { (*.data) }
  
}
