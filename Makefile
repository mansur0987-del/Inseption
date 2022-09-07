all: build up

build:
	@mkdir -p /home/${USER}/data/db
	@mkdir -p /home/${USER}/data/wp
	docker-compose -f srcs/docker-compose.yml build

up:
	docker-compose -f ./srcs/docker-compose.yml up -d

down:
	docker-compose -f ./srcs/docker-compose.yml down

logs:
	docker-compose -f ./srcs/docker-compose.yml logs

ps:
	docker-compose -f ./srcs/docker-compose.yml ps

images:
	docker-compose -f ./srcs/docker-compose.yml images

fclean: down
	@docker rmi -f $$(docker images -qa)
	@docker volume prune --force
	@docker system prune -a --force
	sudo rm -R /home/${USER}/data/db
	sudo rm -R /home/${USER}/data/wp
	@mkdir -p /home/${USER}/data/db
	@mkdir -p /home/${USER}/data/wp

.PHONY:	all build up down logs ps images fclean
