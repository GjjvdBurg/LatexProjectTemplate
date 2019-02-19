# This makefile uses some make magic to run build/copy/clean in each
# subdirectory. Useful stackoverflow links:
# https://stackoverflow.com/questions/1490949/how-to-write-loop-in-makefile
# https://stackoverflow.com/questions/16467718/how-to-print-out-a-variable-in-makefile
# https://stackoverflow.com/questions/10172413/how-to-generate-targets-in-a-makefile-by-iterating-over-a-list
#
IMAGES_DIR=../images/
DIRECTORIES = $(shell find . -mindepth 1 -maxdepth 1 -type d)
TARGETS = $(subst ./,,$(DIRECTORIES))
build_targets = $(addprefix build_, $(TARGETS))
copy_targets = $(addprefix copy_, $(TARGETS))
clean_targets = $(addprefix clean_, $(TARGETS))

.PHONY: all build copy clean

all: build copy

build: $(build_targets)

copy: $(copy_targets)

clean: $(clean_targets)

$(build_targets): build_%: %
	$(info Building directory: $< ...)
	@$(MAKE) -C $< all

$(copy_targets): copy_%: %
	$(info Copying results: $< ...)
	@cp $</*.pdf $(IMAGES_DIR)

$(clean_targets): clean_%: %
	$(info Cleaning directory: $< ...)
	@$(MAKE) -C $< clean
