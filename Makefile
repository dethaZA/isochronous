CFLAGS+=-std=gnu99 -g
LDFLAGS+=-lrt -lm

DESTDIR=
PREFIX=/usr
BINDIR=$(PREFIX)/bin
MANDIR=$(PREFIX)/man

PROGS=udpstress isoping isostream

all: $(PROGS)

udpstress: udpstress.c dscp.h
	$(CC) $(CFLAGS) $< -o $@ $(LDFLAGS)

isoping: isoping.c
	$(CC) $(CFLAGS) $< -o $@ $(LDFLAGS)

isostream: isostream.c
	$(CC) $(CFLAGS) $< -o $@ $(LDFLAGS)

install: all
	mkdir -p $(DESTDIR)$(BINDIR)
	install -m0755 $(PROGS) $(DESTDIR)$(BINDIR)

clean:
	rm -f $(PROGS)
