# 		DSK structure	MEMORY MAP 
# boot0:    	T00/S00		$0800 (M)
# FLOAD:		T00/S01-T00/S0x 	$FC00 (LC)
# MAIN:		T01/S00-Txx/Sxx	$6000 (M)		

DISKNAME = kessesay.dsk

PYTHON = python.exe
ACME = acme.exe -f plain -o
LZ4 = lz4.exe
DIRECTWRITE = $(PYTHON) $(A2SDK)\bin\dw.py
TRANSAIR = $(PYTHON) $(A2SDK)\bin\transair.py
GENDSK = $(PYTHON) $(A2SDK)\bin\genDSK.py
APPLEWIN = $(APPLEWINPATH)\Applewin.exe
DELETE = del

EMULATOR = $(APPLEWIN)

all: $(DISKNAME)

$(DISKNAME): boot.b
# fload.b main.b
	$(GENDSK) $(DISKNAME)
# boot 	T0 S0 	> $800 (M)
	$(DIRECTWRITE) $(DISKNAME) boot.b 0 0 + p
# fload 	T0 S2	> $FC00 (LC)
#	$(DIRECTWRITE) $(DISKNAME) fload.b 0 1 + p
# main.b 	T1 S0 	> $6000 (M)
#	$(DIRECTWRITE) $(DISKNAME) main.b 1 0 + D
#	cp $(DISKNAME) /e/
#	$(TRANSAIR) $(DISKNAME)
	copy lbl_boot.txt $(APPLEWINPATH)\A2_USER1.SYM
	$(TRANSAIR) $(DISKNAME)
	$(EMULATOR) -d1 test.dsk
#$(APPLEWINPATH)\tmp.dsk

#fload.b: boot.a
#	$(ACME) fload.b fload.a

#main.b: main.a macros.a wave.a
#	$(ACME) main.b main.a

boot.b: boot.a
	$(ACME) boot.b boot.a

clean:
	$(DELETE) *.b
	$(DELETE) lbl_*.txt

	