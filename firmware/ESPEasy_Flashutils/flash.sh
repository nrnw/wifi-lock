#!/bin/bash
read -e -p "Serial Port                          :" -i "/dev/ttyUSB0" comport
read -e -p "Flash Size (example 512, 1024, 4096) :" -i "4096" fsize
read -e -p "Build (example 71, 72, ..)           :" -i "120" build

size="${fsize}K"
if [ $fsize -gt 1000 ]; then
	size=$(($fsize/1024))"M"
fi

echo "Expected Flash Size: $size"
echo "Using com port: $comport"
if [ -f ESPEasy_R${build}_${fsize}.bin ]; then
	echo "Using bin file: ESPEasy_R${build}_${fsize}.bin [FOUND]"
	./esptool -vv -cd nodemcu -cb 115200 -bz $size -cp $comport -ca 0x00000 -cf ESPEasy_R${build}_${fsize}.bin
else
	echo "Expected bin file: ESPEasy_R${build}_${fsize}.bin [NOT FOUND!!!]"
fi






