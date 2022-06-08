VERSION_TAG := $(shell git describe --always --tags --abbrev=0)
COMMIT_HASH := $(shell git rev-parse --short HEAD)

EXE    := hyrisc-as
BIN    := bin

.PHONY: $(EXE)
hyrisc-as: $(BIN)/$(EXE)

$(BIN)/$(EXE): ./main.cpp
	mkdir -p $(BIN)

	c++ main.cpp -o $(BIN)/$(EXE) \
		-I"." \
		-DHYRISC_AS_VERSION_TAG=$(VERSION_TAG) \
		-DHYRISC_AS_COMMIT_HASH=$(COMMIT_HASH) \
		-O3

clean:
	rm -rf $(BIN)

install:
	sudo cp -rf $(BIN)/$(EXE) /usr/bin/$(EXE)