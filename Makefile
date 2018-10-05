CXXFLAGS += -std=c++17 -Wall -O3

LDLIBS   += -lgflags

SHELL := /bin/bash

pwgen::

clean::
	rm -f pwgen

check:: pwgen
	diff -Z <(./pwgen --wordlist eff_large_wordlist.txt 11111) <(echo abacus)
	diff -Z <(./pwgen --wordlist eff_large_wordlist.txt 66666) <(echo zoom)
	diff -Z <(./pwgen 11111) <(echo a)
	diff -Z <(./pwgen 66666) <(echo '@')
	diff -Z <(./pwgen --wordlist eff_large_wordlist.txt 22222 33333 44444 55555) <(echo dating handgrip playlist spotter)
