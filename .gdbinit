# Source all settings from the peda dir
source /reverse/peda-git/peda.py

# Intel syntax (Ida-like)
set disassembly-flavor intel
 
# When inspecting large portions of code 
set pagination off

# Keep history. Search using ctrl-r
set history save on
set history filename ~/.gdb_history
set history size 32768
set history expansion on
