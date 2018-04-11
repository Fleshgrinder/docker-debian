include .bootstrap.mk

DOCKERFILES := $(wildcard *.Dockerfile)
IMAGE = fleshgrinder/debian

# special chars for use in string substitution
# see http://blog.jgc.org/2007/06/escaping-comma-and-space-in-gnu-make.html
comma := ,
space :=
space +=

build:: $(DOCKERFILES)

$(DOCKERFILES):: TAG = $(firstword $(subst .,$(space),$@))
$(DOCKERFILES)::
	echo "Building $(IMAGE):$(TAG)"
	docker build --pull --tag $(IMAGE):$(TAG) -f $@ $(CURDIR)

clean::
	echo "Cleaning up $(IMAGE):* images..."
	for tag in $(subst .Dockerfile,,$(DOCKERFILES)); do
		echo "Deleting $(IMAGE):$${tag}"
		docker rmi --force $$(docker images -q $(IMAGE):$${tag}) 2>/dev/null || echo "WARN: no image deleted"
	done
	echo
