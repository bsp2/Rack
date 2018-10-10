NUM_JOBS=20

.PHONY: bin
bin:
	make -f Makefile.glew -j $(NUM_JOBS) bin
	make -f Makefile.jansson -j $(NUM_JOBS) bin
	make -f Makefile.speexdsp -j $(NUM_JOBS) bin

.PHONY: install
install:
	make -f Makefile.glew install
	make -f Makefile.jansson install
	make -f Makefile.speexdsp install

.PHONY: clean
clean:
	make -f Makefile.glew clean
	make -f Makefile.jansson clean
	make -f Makefile.speexdsp clean

