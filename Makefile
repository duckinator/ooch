OC := rock

all: ooch

ooch:
	${OC} ooch

clean:
	rm -rf ooch ${OC}_tmp .libs

.PHONY: all clean