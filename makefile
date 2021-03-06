# COVID-19ABMGuelphS20
# 27/10/20
# ver 2.00
#
# Makefile for the COVID-19 eABM

SRCDIR = ./src/
BINDIR = ./bin/
INCDIR = ./include/

CC = g++
CFLAGS = -std=c++11 -Wall -I./include -I/opt/local/include -I/boost/boost_1_73_0

OBJECTS = $(BINDIR)main.o $(BINDIR)agent.o $(BINDIR)simulation.o $(BINDIR)location.o $(BINDIR)postalCodeHash.o $(BINDIR)SIR.o $(BINDIR)SIRtotals.o $(BINDIR)transportation.o $(BINDIR)geographicalrisk.o $(BINDIR)hospital.o $(BINDIR)isolationcompartment.o

all: library

library:
	@g++ -std=c++11 -Wall -I./include -I/opt/local/include -I/boost/boost_1_73_0 -c -fPIC ./src/agent.cpp
	@g++ -std=c++11 -Wall -I./include -I/opt/local/include -I/boost/boost_1_73_0 -c -fPIC ./src/simulation.cpp
	@g++ -std=c++11 -Wall -I./include -I/opt/local/include -I/boost/boost_1_73_0 -c -fPIC ./src/location.cpp
	@g++ -std=c++11 -Wall -I./include -I/opt/local/include -I/boost/boost_1_73_0 -c -fPIC ./src/postalCodeHash.cpp
	@g++ -std=c++11 -Wall -I./include -I/opt/local/include -I/boost/boost_1_73_0 -c -fPIC ./src/SIR.cpp
	@g++ -std=c++11 -Wall -I./include -I/opt/local/include -I/boost/boost_1_73_0 -c -fPIC ./src/SIRtotals.cpp
	@g++ -std=c++11 -Wall -I./include -I/opt/local/include -I/boost/boost_1_73_0 -c -fPIC ./src/transportation.cpp
	@g++ -std=c++11 -Wall -I./include -I/opt/local/include -I/boost/boost_1_73_0 -c -fPIC ./src/geographicalrisk.cpp
	@g++ -std=c++11 -Wall -I./include -I/opt/local/include -I/boost/boost_1_73_0 -c -fPIC ./src/hospital.cpp
	@g++ -std=c++11 -Wall -I./include -I/opt/local/include -I/boost/boost_1_73_0 -c -fPIC ./src/isolationcompartment.cpp
	@g++ -shared -o libProject.so agent.o simulation.o location.o postalCodeHash.o SIR.o SIRtotals.o transportation.o geographicalrisk.o hospital.o isolationcompartment.o
	@rm agent.o simulation.o location.o postalCodeHash.o SIR.o SIRtotals.o transportation.o geographicalrisk.o hospital.o isolationcompartment.o
	@echo ".so created"

# CObjects: $(BINDIR)abmSim
# 
# $(BINDIR)abmSim: $(OBJECTS)
# 	$(CC) $(OBJECTS) -o $@
# 
# $(BINDIR)main.o: $(SRCDIR)main.cpp
# 	$(CC) $(CFLAGS) -c $(SRCDIR)main.cpp -o $@
# 
# $(BINDIR)agent.o: $(SRCDIR)agent.cpp $(INCDIR)agent.hh
# 	$(CC) $(CFLAGS) -c $(SRCDIR)agent.cpp -o $@
# 
# $(BINDIR)simulation.o: $(SRCDIR)simulation.cpp $(INCDIR)simulation.hh
# 	$(CC) $(CFLAGS) -c $(SRCDIR)simulation.cpp -o $@
# 
# $(BINDIR)location.o: $(SRCDIR)location.cpp $(INCDIR)location.hh
# 	$(CC) $(CFLAGS) -c $(SRCDIR)location.cpp -o $@
# 
# $(BINDIR)postalCodeHash.o: $(SRCDIR)postalCodeHash.cpp $(INCDIR)postalCodeHash.hh
# 	$(CC) $(CFLAGS) -c $(SRCDIR)postalCodeHash.cpp -o $@
# 
# $(BINDIR)SIR.o: $(SRCDIR)SIR.cpp $(INCDIR)SIR.hh
# 	$(CC) $(CFLAGS) -c $(SRCDIR)SIR.cpp -o $@
# 
# $(BINDIR)SIRtotals.o: $(SRCDIR)SIRtotals.cpp $(INCDIR)SIRtotals.hh
# 	$(CC) $(CFLAGS) -c $(SRCDIR)SIRtotals.cpp -o $@
# 
# $(BINDIR)transportation.o: $(SRCDIR)transportation.cpp $(INCDIR)transportation.hh
# 	$(CC) $(CFLAGS) -c $(SRCDIR)transportation.cpp -o $@
# 
# $(BINDIR)geographicalrisk.o: $(SRCDIR)geographicalrisk.cpp $(INCDIR)geographicalrisk.hh
# 	$(CC) $(CFLAGS) -c $(SRCDIR)geographicalrisk.cpp -o $@
# 
# $(BINDIR)hospital.o: $(SRCDIR)hospital.cpp $(INCDIR)hospital.hh
# 	$(CC) $(CFLAGS) -c $(SRCDIR)hospital.cpp -o $@
# 
# $(BINDIR)isolationcompartment.o: $(SRCDIR)isolationcompartment.cpp $(INCDIR)isolationcompartment.hh
# 	$(CC) $(CFLAGS) -c $(SRCDIR)isolationcompartment.cpp -o $@
#
# run:
#	$(BINDIR)abmSim
#
# memtest:
#	valgrind --leak-check=full -s $(BINDIR)abmSim
#
clean:
	rm libProject.so