## Smart Makefile for general purpose (Ver 1.0)
## Author: Yongkang TANG <tangyk{at}gmail>
## License: FreeBSD 
## Please use this makefile at YOUR OWN RISK !!!

CC=g++

# compile flags & include path of third part library.  e.g. CFLAGS= -c -Wall -g -I/any/path/inlude
CFLAGS= -c -Wall -g 

# libraries  e.g. LIBS = -lGL -lGLU `pkg-config --libs opencv`
LIBS=  -lm

# root directory of source files
SRCDIR = .

# Application Name
APP=app

########################### DO NOT MODIFY FOLLOWING STATEMENTS!!! ##########
EXTS = *.C *.c *.cxx *.CXX *.cpp *.CPP *.cc *.CC
DIRS := ${shell find ${SRCDIR} -type d -print}
SRCS := $(foreach dir,$(DIRS),$(wildcard $(addprefix $(dir)/,$(EXTS))))
ICLS := $(foreach dir,$(DIRS), $(addprefix -I,$(dir)))
OBJS=$(addsuffix .o, $(SRCS))
CFLAGS += ${ICLS}

define CMPL_SRC
${1}.o:
	${CC} $(CFLAGS) ${1} -o ${1}.o
endef

.PHONY: all clean
.SUFFIXES:

all: $(APP)

$(foreach s,$(SRCS),$(eval $(call CMPL_SRC, $(s))))

$(APP):$(OBJS)
	$(CC) -o $@ $(OBJS) $(LIBS)

clean:
	rm -f ${OBJS} ${APP}  

