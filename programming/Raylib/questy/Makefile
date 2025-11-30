CC = gcc
CFLAGS = -lraylib -Wextra -Wall -Og
SRC = questy.c
TARGET = questy

$(TARGET): $(SRC)
	$(CC) $(CFLAGS) $(SRC) -o $(TARGET)
	@echo "Done!"

run:
	./$(TARGET)

clean:
	rm -f $(TARGET)
