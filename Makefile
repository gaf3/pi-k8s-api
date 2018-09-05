IMAGE=pi-k8s-api
VERSION=0.1
PORT=6589
NAMESPACE=pi-k8s-api

build:
	docker build . -t $(IMAGE):$(VERSION)

shell: build
	docker run -it $(IMAGE):$(VERSION) sh

run: build
	docker run -it --rm -p $(PORT):$(PORT) -h $(IMAGE) $(IMAGE):$(VERSION)

test: build
	docker run -it $(IMAGE):$(VERSION) python -m unittest discover test
