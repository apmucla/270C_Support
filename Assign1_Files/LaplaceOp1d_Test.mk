#
#  LaplaceOp1d_Test.mk : Sample "minimal" make file for LaplaceOp1d_Test  
#
#  Execute this makefile by typing "make -f LaplaceOp1d_Test.mk" at the command
#  prompt. If you edit this file, be aware that in makefiles tabs are
#  significant. 
#
#  To clean the directory of .o files and .exe files type
#  "make -f "LaplaceOp1d_Test.mk clean" at the command line.  
#
#  The executable created by this make file is LaplaceOp1d_Test.exe
#
#  03/28/2019
#
CC         =  g++
INCLUDES  += -I../270C_Support    # Specifying location of C++ support file directories

DEFINES= -D _DEBUG                 # Specify DEFINES= -D _DEBUG to enable array bounds checking
                                   # otherwise just leave the rest of the line empty

CCFLAGS= -std=c++11                # Need to use C++ 11 constructs

# Specifying the dependencies for the executable file and then the rule for linking.

LaplaceOp1d_Test.exe : LaplaceOp1d_Test.o 
	$(CC) LaplaceOp1d_Test.o -o LaplaceOp1d_Test.exe

# Specifying the dependencies for the object file and then the rule for compilation. 
# (Using \ for line continuation)

LaplaceOp1d_Test.o: LaplaceOp1d_Test.cpp  \
../270C_Support/SparseOp/SCC_SparseOp.h \
../270C_Support/DoubleVectorNd/SCC_DoubleVector1d.h
	$(CC) -c $(CCFLAGS) $(DEFINES) $(INCLUDES) $< 

%.o  : %.cpp 
	$(CC) -c $(CCFLAGS) $(DEFINES) $(INCLUDES) $< 

clean :
	rm *.o
	rm *.exe
