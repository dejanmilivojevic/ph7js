CC=emcc
CXX=g++
RM=rm -f
CPPFLAGS=-O3
LDFLAGS=-O3
LDLIBS=

SRCS=ph7_run.c ph7.c
OBJS=$(subst .c,.o,$(SRCS))

all: ph7_run

ph7_run: $(OBJS)
	$(CC) $(LDFLAGS) -o ph7_run.js $(OBJS) $(LDLIBS) 

depend: .depend

.depend: $(SRCS)
	rm -f ./.depend
	$(CC) $(CPPFLAGS) -MM $^>>./.depend;

clean:
	$(RM) $(OBJS)

dist-clean: clean
	$(RM) *~ .depend

include .depend
