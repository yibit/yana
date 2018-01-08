
include ./build_config.mk

# build and run the whole website
start: build
	cd _site && python -m $(HTTP_MODULE) 9876

down:
	sh down.sh

build:
	sh build.sh
	mkdocs build --clean
	sh build.sh --add-missing

deps:
	sudo pip install -r requirements.txt

# just serve the api docs for local development
serve:
	sh build.sh
	mkdocs serve -a 127.0.0.1:9877

docker: build
	docker build --no-cache -t yana-site .

docker-start:
	docker run -d -p 9876:9876 --name=yana-site yana-site

docker-down:
	docker stop yana-site

.PHONY: clean

clean:
	rm -rf _site
