clean:
	docker rmi -f pyldap-base pyldap-builder pyldap-consumer
	rm dist/*.whl

base:
	docker build -t pyldap-base --file Dockerfile.base .

builder: base
	docker build -t pyldap-builder --file Dockerfile.build .

build: builder
	docker run --rm -v $(shell pwd)/scripts:/scripts -v $(shell pwd)/dist:/dist pyldap-builder /scripts/build.sh

consumer: base
	docker build -t pyldap-consumer --file Dockerfile.consume .

test: consumer build
	docker run --rm -v $(shell pwd)/scripts:/scripts -v $(shell pwd)/dist:/dist pyldap-consumer /scripts/test.sh



