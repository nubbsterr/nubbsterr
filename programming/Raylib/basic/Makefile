CC = gcc
CFLAGS = -lraylib -Wextra -Wall
SRC = basicexample.c
TARGET = basic

$(TARGET): $(SRC)
	$(CC) $(CFLAGS) $(SRC) -o $(TARGET)
	@echo "Done!"

run:
	./$(TARGET)

clean:
	rm -f $(TARGET)
