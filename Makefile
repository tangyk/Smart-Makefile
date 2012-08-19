#############################################################
## Smart Makefile for general purpose (Ver 1.1)
## Author: Yongkang TANG <tangyk%at%gmail>
## License: FreeBSD 
## Please use this makefile at YOUR OWN RISK !!!
#############################################################
CC=g++

# compile flags & include path of third part library.  e.g. CFLAGS= -c -Wall -g -I/any/path/inlude
CFLAGS= -c -Wall -g 

# libraries  e.g. LIBS = -lGL -lGLU `pkg-config --libs opencv`
LIBS=  -lm

# root directory of source files
# DO NOT END with / mark.  e.g. SRC_DIR = . , SRC_DIR = ./test1 
SRC_DIR = .

# application list e.g. APP = app1 app2 app3
APP = app

# exclude sources for app1 
# relative path from ${SRC_DIR}. e.g.  app1_EXCL = ./test/path/test1.cpp
#app1_EXCL=./test.cpp ./test2.cxx

# exclude sources for app2 
#app2_EXCL = ./test2/src/test3.cpp ./test2.cxx
# special libs for app2 
#app2_LIBS = -lxxx

########################### DO NOT MODIFY FOLLOWING STATEMENTS!!! ##########
EXTS := *.C *.c *.cxx *.CXX *.cpp *.CPP *.cc *.CC
DIRS := ${shell find ${SRC_DIR} -type d -print}
SRCS := $(foreach dir,$(DIRS),$(wildcard $(addprefix $(dir)/,$(EXTS))))
CFLAGS += $(foreach dir,$(DIRS), $(addprefix -I,$(dir)))
OBJS := $(addsuffix .o, $(SRCS))

define CMPL_APP
$(1): $(filter-out $(addsuffix .o,$(value $(1)_EXCL)), $(OBJS))
	$(CC) -o $(1) $(filter-out $(addsuffix .o, $(value $(addsuffix _EXCL, $(1)))), $(OBJS)) $(LIBS) $(value $(addsuffix _LIBS, $(1)))
endef

define CMPL_SRC
${1}.o:${1}
	${CC} $(CFLAGS) ${1} -o ${1}.o
endef

.PHONY: all clean
.SUFFIXES:

all: $(APP)
	
$(foreach s,$(SRCS),$(eval $(call CMPL_SRC, $(s))))
$(foreach ap,$(APP),$(eval $(call CMPL_APP, $(ap))))

clean:
	rm -f ${OBJS} ${value APP}  

