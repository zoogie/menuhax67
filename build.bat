make clean REGION="USA"
cp rop_gadgets_usa.h rop_gadgets.h 
make REGION="USA"
cp rop_payload.bin menuhax67_installer/data/rop_usa.bin

make clean REGION="USA30"
cp rop_gadgets_usa30.h rop_gadgets.h 
make REGION="USA30"
cp rop_payload.bin menuhax67_installer/data/rop_usa30.bin

make clean REGION="EUR"
cp rop_gadgets_eur.h rop_gadgets.h 
make REGION="EUR"
cp rop_payload.bin menuhax67_installer/data/rop_eur.bin

make clean REGION="JPN"
cp rop_gadgets_jpn.h rop_gadgets.h 
make REGION="JPN"
cp rop_payload.bin menuhax67_installer/data/rop_jpn.bin

make clean REGION="KOR"
cp rop_gadgets_kor.h rop_gadgets.h 
make REGION="KOR"
cp rop_payload.bin menuhax67_installer/data/rop_kor.bin

cd menuhax67_installer && make clean && make
cp menuhax67_installer.3dsx f:/3ds
pause