REPO_NAME	?= local
IMAGE_NAME	= $(REPO_NAME)/mkdocs-material
TAG		= 8.3.9

help:	## Show this help.
	@sed -ne '/@sed/!s/## //p' $(MAKEFILE_LIST)

build:	## build
	docker build \
		-t $(IMAGE_NAME):$(TAG) \
		-t $(IMAGE_NAME):latest \
		--build-arg VARIANT=$(TAG) \
		.

scan:	## scan
	docker scan $(IMAGE_NAME):$(TAG)

push:	## push
	docker push $(IMAGE_NAME):$(TAG)
	docker push $(IMAGE_NAME):latest

login:	## login docker shell
	docker run -it --rm -v $(PWD):/docs --entrypoint /bin/sh $(IMAGE_NAME):latest

