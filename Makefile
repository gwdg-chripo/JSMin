# Set the following variables to match your Linux system
CC=gcc
CFLAGS=-O2 -march=native -fomit-frame-pointer
PREFIX=/usr/local

# Makefile targets. Only change things below this line if you know what you are doing! ;-)

# Default make target
.PHONY: all
all: jsmin

# Build JSMin
jsmin: jsmin.c
	$(CC) $(CFLAGS) -o jsmin jsmin.c

# Install JSMin
.PHONY: install
install: all
	test -d $(PREFIX)/bin || mkdir -p $(PREFIX)/bin
	install -m 0755 jsmin $(PREFIX)/bin
	install -m 0755 packer-jsmin $(PREFIX)/bin

# Clean up directory
.PHONY: clean
clean:
	rm -f jsmin
