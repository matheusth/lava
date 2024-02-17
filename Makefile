TARGET = bin/lava
SRC = $(wildcard src/*.cpp)
OBJ = $(patsubst src/%.cpp, obj/%.o, $(SRC))
LDFLAGS = -lglfw -lvulkan -ldl -lpthread -lX11 -lXxf86vm -lXrandr -lXi
CFLAGS = -g -std=c++17

$(TARGET): $(OBJ)
	@mkdir $(@D)
	clang++ $(CFLAGS) $? -o $@ $(LDFLAGS)

$(OBJ): $(SRC)
	@mkdir $(@D)
	clang++ $(CFLAGS) -c $? -o $@

clean:
	rm -rf ./bin
	rm -rf ./obj
