CC := csc


.PHONY: default all build install clean run

default: all

all: build clean run

build:

clean:

install:

run:

main: main.o secret.o

%.o: %.scm
	$(CC) -c

%.so: %.scm
	$(CC) -s -J

