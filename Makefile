APP         = stephen-site
APPIMAGE    = localhost:5000/test/$(APP)
TAG        ?= dev

IMAGE       = stephen-site-ci
CONTAINER   = $(IMAGE)
CHECKOUT    = $(PWD)
WORK        = /home/default/project

RUNARGS     = --name $(CONTAINER) --rm -v $(CHECKOUT):$(WORK) -w $(WORK)
BUILDENV    = $(RUNARGS) $(IMAGE):$(TAG)

clean:
	docker rm $(CONTAINER)	|| true
	docker rmi $(IMAGE)		|| true
	docker rm $(APP)		|| true
	docker rmi $(APPIMAGE)	|| true

prepare:
	docker build -t $(IMAGE):$(TAG) -f Dockerfile .

test:
	docker run $(BUILDENV) ash -c "pip install -e ."

package:
	docker build -t $(APPIMAGE):$(TAG) -f app/Dockerfile .

build: clean prepare test package

run:
	docker run -p 3168:3168 --name $(APP) --rm $(APPIMAGE):$(TAG)

enter:
		docker run -p 3168:3168 -it --name $(APP) --rm $(APPIMAGE):$(TAG) bash