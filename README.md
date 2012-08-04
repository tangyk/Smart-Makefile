Smart-Makefile is a smart powerful makefile for compiling c/cpp sources.

#############################################################
## Smart Makefile for general purpose (Ver 1.1)
## Author: Yongkang TANG <tangyk%at%gmail>
## License: FreeBSD 
## Please use this makefile at YOUR OWN RISK !!!
#############################################################
This is makefile is free for any purpose, without any without warranty.

Usage:
1, add neccesary compiling flags to CFLAGS.

2, add neccesary libs name and path to LIBS.
   e.g. LIBS = `pkg-config --libs opencv` -lm -lGL -L/usr/local/lib/path

3, set SRC_DIR for searching source files, Smart-Makefile will search all of the sources and possible include path basing on ${SRC_DIR}.
   SRC_DIR should NOT END with "/" mark.  
   e.g. SRC_DIR = . # current directory
        SRC_DIR = .. # upper directory
        SRC_DIR = ./test1 # test1 folder from current  
        
4, set excutable application list to APP
	e.g. APP = myApp # Only one excutable applicatoin
	e.g. APP = app1 app2 app3 # for multiple excutable applications, step 5 is neccesary

5, [Optinal] Setting excluding source for each applications when multiple application is setted to ${APP}.
suppose a applicaiton named app1, the excluding source list should be setted to a variable named by application name cantenating with "_EXCL" --> app1_EXCL, with blank space seperated source files.
e.g.  app1_EXCL = ./test1/test1.cpp ./test2/test2.cpp
for another application named Testa, the excluding source list should be setted to variable Testa_EXCL.
