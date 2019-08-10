#!/bin/bash
#Generate Turrets and their Bullets
rm -rf ../assets/generated
mkdir ../assets/generated
saxonb-xslt -ext:on -tree:linked -o ../assets/generated/index.xml turrets.xml macro_gen.xsl
mv -f ../assets/generated/index.xml ../index/macros.xml
