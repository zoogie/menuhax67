make clean
cp rop_gadgets_usa.h rop_gadgets.h 
make REGION="USA"
cp rop_payload.bin menuhax67_installer/data/rop_usa.bin

make clean
cp rop_gadgets_eur.h rop_gadgets.h 
make REGION="EUR"
cp rop_payload.bin menuhax67_installer/data/rop_eur.bin

make clean
cp rop_gadgets_jpn.h rop_gadgets.h 
make REGION="JPN"
cp rop_payload.bin menuhax67_installer/data/rop_jpn.bin

cd menuhax67_installer && make clean && make
pause