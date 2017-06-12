#########################################################################
# vim: ts=8 sw=8
#########################################################################
# Author:   tf135c (James Reynolds)
# Filename: Makefile
# Date:     2006-11-28 11:54:27
#########################################################################
# Note that we use '::' rules to allow multiple rule sets for the same
# target.  Read that as "modularity exemplarized".
#########################################################################

PREFIX	:=${HOME}/opt/$(shell uname -m)
BINDIR	=${PREFIX}/bin

TEMPLATES:=$(wildcard t_*)

TARGETS	=all clean distclean clobber check install uninstall tags
TARGET	=all

SUBDIRS	=

.PHONY:	${TARGETS} ${SUBDIRS}

CC	=gcc -march=native -std=gnu99
DEFS	=-D_FORTIFY_SOURCE=2
DEFS	+=-DHAVE_READLINE=1
OPT	=-Os
INCS	=-I.
CFLAGS	=${OPT} -Wall -Wextra -Werror -pedantic -pipe -g ${DEFS} ${INCS}
LDFLAGS	=-g
LDLIBS	=-lSegFault
LDLIBS	+=-lreadline -ltermcap

all::	isatty

${TARGETS}::

clean::
	${RM} a.out *.o core.* lint tags

distclean clobber:: clean
	${RM} isatty

check::	isatty
	./isatty ${ARGS}

install:: isatty
	install -d ${BINDIR}
	install -c -s isatty ${BINDIR}/

uninstall::
	${RM} ${BINDIR}/isatty

tags::
	ctags -R .

# ${TARGETS}::
# 	${MAKE} TARGET=$@ ${SUBDIRS}

# ${SUBDIRS}::
# 	${MAKE} -C $@ ${TARGET}
