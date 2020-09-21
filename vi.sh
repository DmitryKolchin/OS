 #!/bin/bash
log_file=~/.local/share/xorg/Xorg.0.log
awk '{$3="(WW)"; print}' "$log_file" | sed 's/(WW)/Warning/g' > full.log
awk '{$3="(II)"; print}' "$log_file" | sed 's/(II)/Information/g' >> full.log
cat full.log 
