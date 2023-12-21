CC = clang
DEBUG = -g

CFLAGS = $(DEBUG) -Wall -Wshadow -Wunreachable-code \
		-Wredundant-decls -Wmissing-declarations -Wold-style-definition \
		-Wmissing-prototypes

clox: main.o chunk.o memory.o debug.o
	@$(CC) $(CFLAGS) -o $@ $^
	@chmod u+rx $@
	@./clox

main.o: main.c
	@$(CC) $(CFLAGS) -c $<

chunk.o: chunk.c chunk.h
	@$(CC) $(CFLAGS) -c $<

memory.o: memory.c memory.h
	@$(CC) $(CFLAGS) -c $<

debug.o: debug.c debug.h
	@$(CC) $(CFLAGS) -c $<

clean cls:
	-rm -f clox *.o *~ \#*
