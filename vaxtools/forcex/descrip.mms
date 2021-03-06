OPTIMIZE=/OPTIMIZE
TRACEBACK=/NOTRACE
!DEBUG=/DEBUG
BFLAGS=$(BFLAGS)$(OPTIMIZE)$(DEBUG)/LIST/MACHINE=(ASSEMBLER,UNIQUE)
LINKFLAGS=$(LINKFLAGS)/MAP$(DEBUG)$(TRACEBACK)                 
PRODVERSION=V01.01
PKGVERSION=V0101
KITVERSION=010

ALL :	FORCEX.EXE
	WRITE SYS$OUTPUT "-- DONE --"


KIT :	FORCEX$(KITVERSION)
	WRITE SYS$OUTPUT "--- DONE ---"

                     
FORCEX$(KITVERSION) :	FORCEX.KIT KITINSTAL.COM -
			FORCEX_CMD.CLD FORCEX.OBJ FORCEX.HLP
	@SYS$UPDATE:SPKITBLD FORCEX$(KITVERSION) FORCEX_DIR: "" FORCEX.KIT

PACKAGE :	JGP-VAXVMS-FORCEX-$(PKGVERSION)--1.PCSI
	WRITE SYS$OUTPUT "--- DONE ---"

JGP-VAXVMS-FORCEX-$(PKGVERSION)--1.PCSI : FORCEX.OBJ -
					 FORCEX.PDF FORCEX.PCSI$TEXT -
					 FORCEX_CMD.CLD FORCEX.HLP -
					 FORCEX_LINK.COM
	PRODUCT PACKAGE FORCEX -
		/FORMAT=SEQUENTIAL -
		/SOURCE=FORCEX.PDF -
		/MATERIAL=FORCEX_DIR -
		/DEST=FORCEX_DIR -
		/VERSION=$(PRODVERSION) -
		/TRACE/LOG

forcex.exe :	forcex.b32

