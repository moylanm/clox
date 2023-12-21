CC = clang
DEBUG = -g

CFLAGS = $(DEBUG) -Wall -Wshadow -Wunreachable-code \
		-Wredundant-decls -Wmissing-declarations -Wold-style-definition \
		-Wmissing-prototypes

clox: main.o chunk.o memory.o
	$(CC) $(CFLAGS) -o $@ $^
	chmod u+rx $@

main.o: main.c
	$(CC) $(CFLAGS) -c $<

chunk.o: chunk.c chunk.h
	$(CC) $(CFLAGS) -c $<

memory.o: memory.c memory.h
	$(CC) $(CFLAGS) -c $<

clean cls:
	-rm -f clox *.o *~ \#*