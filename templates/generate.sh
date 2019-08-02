#!/bin/bash
#Generate Turrets and their Bullets
rm -rf ../assets/generated
mkdir ../assets/generated
saxonb-xslt -ext:on -tree:linked -o ../assets/generated/bla.xml turrets.xml turrets.xsl
