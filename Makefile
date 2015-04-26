export PATH := bin:$(PATH)

PHONY := all
all: build build_doc

PHONY += clean
clean:
	rm -r doc | true
	rm nncss.css | true
	rm sample.html | true

# Rules for building code
PHONY += build
build: sample.html nncss.css

nncss.css: src/nncss.org
	tangle.sh $<
	mv -f src/nncss.css .

sample.html: src/sample.org
	tangle.sh $<
	mv -f src/sample.html .

# Rules for building documentation
PHONY += build_doc
build_doc: doc/nncss.html doc/sample.html

doc/nncss.html: src/nncss.org
	export.sh $<
	mkdir -p doc
	mv -f src/nncss.html doc

doc/sample.html: src/sample.org
	export.sh $<
	mkdir -p doc
	mv -f src/sample.html doc

.PHONY: $(PHONY)
