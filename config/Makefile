all: config/mconf

config: config.tar.bz2
	bzip2 -cd config.tar.bz2| tar -x

config/mconf: config
	$(MAKE) -C config

clean:
	rm -rf config
