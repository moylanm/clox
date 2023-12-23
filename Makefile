CC = clang
DEBUG = -g

CFLAGS = $(DEBUG) -Wall -Wshadow -Wunreachable-code \
		-Wredundant-decls -Wmissing-declarations -Wold-style-definition

clox: main.o chunk.o memory.o debug.o value.o vm.o
	@$(CC) $(CFLAGS) -o $@ $^
	@chmod u+rx $@
	@./$@

main.o: main.c
	@$(CC) $(CFLAGS) -c $<

chunk.o: chunk.c chunk.h
	@$(CC) $(CFLAGS) -c $<

memory.o: memory.c memory.h
	@$(CC) $(CFLAGS) -c $<

debug.o: debug.c debug.h
	@$(CC) $(CFLAGS) -c $<

value.o: value.c value.h
	@$(CC) $(CFLAGS) -c $<

vm.o: vm.c vm.h
	@$(CC) $(CFLAGS) -c $<

clean cls:
	-rm -f clox *.o *~ \#*
