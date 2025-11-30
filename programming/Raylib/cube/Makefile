CC = gcc
CFLAGS = -lraylib -Wextra -Wall -Og
SRC = cube.c
TARGET = cube

$(TARGET): $(SRC)
	$(CC) $(CFLAGS) $(SRC) -o $(TARGET)
	@echo "Done!"

run:
	./$(TARGET)

clean:
	rm -f $(TARGET)
