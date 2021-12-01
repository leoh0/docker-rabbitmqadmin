latest: Dockerfile
	@docker build -t leoh0/rabbitmqadmin .

run:
	@docker run --rm \
		--name test-rabbitmqadmin \
		leoh0/rabbitmqadmin \
		--version
