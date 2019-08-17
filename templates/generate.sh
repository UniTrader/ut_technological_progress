#!/bin/bash
#Generate Turrets and their Bullets
rm -rf ../assets/generated
mkdir ../assets/generated
saxonb-xslt -ext:on -tree:linked -o ../assets/generated/index.xml turrets.xml macro_gen.xsl
saxonb-xslt -ext:on -tree:linked -o ../index/macros.xml turrets.xml index_macros_gen.xsl
