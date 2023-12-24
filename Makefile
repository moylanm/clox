CC := clang
DEBUG := -g

CFLAGS := $(DEBUG) -Wall -Wshadow -Wunreachable-code \
		-Wredundant-decls -Wmissing-declarations -Wold-style-definition

PROJ := clox

SRC := src
OBJ := obj

SOURCES = $(wildcard $(SRC)/*.c)
OBJECTS = $(patsubst $(SRC)/%.c, $(OBJ)/%.o, $(SOURCES))

$(PROJ): all
	@chmod u+rx $(PROJ)
	@./$(PROJ)

all: $(OBJECTS)
	@$(CC) $(CFLAGS) $^ -o $(PROJ)

$(OBJ)/%.o: $(SRC)/%.c
	@$(CC) $(CFLAGS) -I$(SRC) -c $< -o $@

clean cls:
	-rm -f $(OBJ)/*.o $(PROJ)
