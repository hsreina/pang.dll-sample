# =============================================================
# =============================================================
BCDIR = C:\Borland\Bcc55

.AUTODEPEND

# Borland tools defines
IMPLIB    = $(BCDIR)\bin\Implib
ILINK32   = $(BCDIR)\bin\ILink32
TLIB      = $(BCDIR)\bin\TLib
BRC32     = $(BCDIR)\bin\Brc32
TASM32    = $(BCDIR)\bin\Tasm32
CC        = $(BCDIR)\bin\BCC32
BCLEAN    = $(BCDIR)\bin\Bclean

# Borland Default Directories
BCLIBDIRS = $(BCDIR)\lib;$(BCDIR)\lib\psdk
BCINCDIRS = $(BCDIR)\include

# Borland Libraries
BCC32RTLIB      = cw32
MULTITHREAD     = mt
DYN             = i
WINIMPORTLIB    = import32

# Startup object
DOS_STARTUP     = c0x32.obj
WIN_STARTUP     = c0w32.obj
DLL_STARTUP     = c0d32.obj

# Compiler Defines
BCC32RTLDEF     = -D_RTLDLL
NOT2000DEF      = -D_WINVER=0x0400 -D_WIN32_WINNT=0x0400

# File Extensions
BCTEMPS         = *.il? *.csm *.tds *.map *.rws *.@@@ *.td2 *.tr2 *.mps
EDITTEMPS       = *.bak *.org *.$$*
# =============================================================
# =============================================================

# Input/output directories
oDir    = .\obj
Bin     = .
Src     = .
Lib     = \lib
libDirs = -L$(EXTRALIBDIRS)$(BCLIBDIRS)
incDirs = -I$(EXTRAINCDIRS)$(BCINCDIRS)

# Runtime Library
RTLIB = $(BCC32RTLIB).lib

EXTRALIBDIRS = 
EXTRAINCDIRS = 
libDirs = -L$(EXTRALIBDIRS)$(BCLIBDIRS)
incDirs = -I$(EXTRAINCDIRS)$(BCINCDIRS)

# Compiler flags
C_FLAGS_EXE = -DAPPLICATION=1 -q -P- -K $(NOT2000DEF) -v -k -y -Od -tC -4 
# Linker flags
L_FLAGS_EXE = -x -c -v -ap -Tpe 

# Compiler flags
C_FLAGS_DLL = -DLIBRARY=1 -q -P- -K $(NOT2000DEF) -v -k -y -Od -tC -tWD -4 
# Linker flags
L_FLAGS_DLL = -x -c -v -ap -Tpd -Gi

TARGETDLL 	= $(Bin)\pang.dll

# Targets -------------------------------------------

all: $(TARGETDLL)

# Linking Dependencies-------------------------------

$(Bin)\pang.dll : $(OBJSDLL)
	$(ILINK32) @&&|
	$(L_FLAGS_DLL) $(libDirs) +
	$(DLL_STARTUP) +
	$(oDir)\main_dll.obj +
	,$<,, +
	$(WINIMPORTLIB).lib +
	$(RTLIB) +
|

# Compiling Dependencies-------------------------------

$(oDir)\main_dll.obj : $(Src)\main.cpp
	$(CC) -c $(C_FLAGS_DLL) $(incDirs) -o$@ $(Src)\main.cpp
