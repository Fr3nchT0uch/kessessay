# 		DSK structure	MEMORY MAP 
# boot0:    	T00/S00		$0800 (M)
# MAIN:		T00/S01-Txx/Sxx	$6000 (M)		

DISKNAME = kessessay.dsk

PYTHON = python.exe
ACME = acme.exe -f plain -o
# All the Python scripts are available here: http://fr3nch.t0uch.free.fr/
DIRECTWRITE = $(PYTHON) $(A2SDK)\bin\dw.py
TRANSAIR = $(PYTHON) $(A2SDK)\bin\transair.py
APPLEWIN = $(APPLEWINPATH)\Applewin.exe
# OS shell commands
DELETE = del
COPY = copy /Y

EMULATOR = $(APPLEWIN)

all: $(DISKNAME)

$(DISKNAME): boot.b main.b
# Get empty dsk
	$(COPY) dsk.template $(DISKNAME)
# boot 	T0 S0 	> $800 (M)
	$(DIRECTWRITE) $(DISKNAME) boot.b 0 0 + p
# main 	T0 S1 	> $6000 (M)
	$(DIRECTWRITE) $(DISKNAME) main.b 0 1 + p
# (optional) Send DSK to a Toshiba FlashAir SD Card
#	$(TRANSAIR) $(DISKNAME)
# (optional) Copy debug labels for AppleWin
	copy lbl_main.txt "$(APPLEWINPATH)\A2_USER1.SYM"
# (optional) Run AppleWin
	copy $(DISKNAME) "U:\Apple II\$(DISKNAME)"
	$(EMULATOR) -d1 test.dsk

main.b: main.a
	$(ACME) main.b main.a

boot.b: boot.a
	$(ACME) boot.b boot.a

clean:
	$(DELETE) *.b
	$(DELETE) lbl_*.txt

	