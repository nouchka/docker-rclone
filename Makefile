DOCKER_IMAGE=rclone

include Makefile.docker

PACKAGE_VERSION=0.1

include Makefile.package

.PHONY: check-version
check-version:
	docker run --rm --entrypoint rclone $(DOCKER_NAMESPACE)/$(DOCKER_IMAGE):$(VERSION) --version| grep $(DOCKER_IMAGE)| awk '{print $$2}'
	