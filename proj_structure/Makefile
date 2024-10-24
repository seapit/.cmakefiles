# Define the build directory
BUILD_DIR := build
# Define the directory containing the libraries
LIB_DIR := libs
# Define the directory containing the applications
APP_DIR := apps

# Define the default target
.PHONY: all
all: help

ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))

%:
	@true

# Display help message
.PHONY: help
help:
	@echo "Usage:"
	@echo "  make libs                       - Compile all libraries"
	@echo "  make lib target_name            - Compile the specified static or shared library"
	@echo "  make tests                      - Compile and execute tests for all libraries"
	@echo "  make apps                       - Compile all applications"
	@echo "  make app target_name            - Compile the specified application"
	@echo "  make config                     - Configure CMake project"
	@echo "  make clean                      - Clean the build directory"

# Run CMake configuration
.PHONY: config
config:
	@echo "Configuring CMake project..."
	@rm -rf $(BUILD_DIR)
	@mkdir -p $(BUILD_DIR)
	@cd $(BUILD_DIR) && cmake -DCMAKE_BUILD_TYPE=Release ..

.PHONY: config_test
config-test:
	@echo "Configuring CMake project..."
	@rm -rf $(BUILD_DIR)
	@mkdir -p $(BUILD_DIR)
	@cd $(BUILD_DIR) && cmake -DBUILD_TESTING=ON -DCMAKE_BUILD_TYPE=Debug ..

# Compile and execute tests for all libraries
.PHONY: test
test: config_test
	@if [ -z "$(ARGS)" ]; then \
		echo "Please specify a target library using 'make test Lib1'"; \
		exit 1; \
	fi
	@echo "Building and running tests for library: $(ARGS)"
	@cd $(BUILD_DIR) && cmake --build . --target $(ARGS)_Test

# Compile the specified library or application
lib: config
	@if [ -z "$(ARGS)" ]; then \
		echo "Please specify a target library using 'make lib Lib1 Lib2'"; \
		exit 1; \
	fi
	@echo "Building library: $(ARGS)"
	@cd $(BUILD_DIR) && cmake --build . --target $(ARGS)

app: config
	@if [ -z "$(ARGS)" ]; then \
		echo "Please specify an application using 'make app App1 App2'"; \
		exit 1; \
	fi
	@echo "Building application: $(ARGS)"
	@cd $(BUILD_DIR) && cmake -DAPP=ON --build . --target $(ARGS)

# Compile all applications
.PHONY: apps
apps: config
	@echo "Building all applications..."
	@cd $(BUILD_DIR) && cmake --build . --target all_apps

# Compile all libraries
.PHONY: libs
libs: config
	@echo "Building all libraries..."
	@cd $(BUILD_DIR) && cmake --build . --target all_libs

# Clean the build directory
.PHONY: clean
clean:
	@echo "Cleaning build directory"
	@rm -rf $(BUILD_DIR)
