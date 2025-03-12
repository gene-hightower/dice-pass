CXXFLAGS += -std=c++23 -Wall -O3

LDLIBS   += -lgflags

SHELL := /bin/bash

BINDIR ?= $(PREFIX)/bin

pwgen-dice::

install:: pwgen-dice
	cp pwgen-dice $(BINDIR)

clean::
	rm -f pwgen-dice

check:: pwgen-dice
	diff -Z <(./pwgen-dice --wordlist eff_large_wordlist.txt 11111) <(echo abacus)
	diff -Z <(./pwgen-dice --wordlist eff_large_wordlist.txt 66666) <(echo zoom)
	diff -Z <(./pwgen-dice 11111) <(echo a)
	diff -Z <(./pwgen-dice 66666) <(echo '@')
	diff -Z <(./pwgen-dice --wordlist eff_large_wordlist.txt 22222 33333 44444 55555) <(echo dating handgrip playlist spotter)
