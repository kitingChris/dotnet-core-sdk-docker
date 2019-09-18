ifeq (,$(wildcard ./Dockerfile))
%:
	$(error "No Dockerfile present in current directory")
endif

-include .makerc

.PHONY: all build image clean

image: build clean alias

all: build clean alias push

clean:
	docker system prune --volumes --force

build:
	docker build $(BUILD_ARGS) --rm --tag $(REPO_PATH)/$(NAME):$(TAG) .

push:
	docker push $(REPO_PATH)/$(NAME):$(TAG);
