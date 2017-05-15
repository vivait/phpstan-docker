VERSIONS := 0.6 0.7 latest
BUILD_ALL_VERSIONS := $(addprefix build-, $(VERSIONS))
TEST_ALL_VERSIONS := $(addprefix test-, $(VERSIONS))

all: test

.PHONY: build build-base $(BUILD_ALL_VERSIONS)
build-base:
	docker build -t phpstan/phpstan:base base

$(BUILD_ALL_VERSIONS): build-%: build-base
	docker build -t phpstan/phpstan:$* $*

build: $(BUILD_ALL_VERSIONS)

.PHONY: test $(TEST_ALL_VERSIONS)
$(TEST_ALL_VERSIONS): test-%:
	@echo "Test $*"
	@docker run --rm phpstan/phpstan:$* list

test: build $(TEST_ALL_VERSIONS)
