all:	up

up:
		@mkdir -p $$HOME/data/mariadb
		@mkdir -p $$HOME/data/wordpress
		@docker compose -f srcs/docker-compose.yml up -d

down:
		@docker compose -f srcs/docker-compose.yml down

ps:
		@docker compose -f srcs/docker-compose.yml ps

fclean:	down
		@docker image rm  $$(docker image ls -aq)
		@docker volume rm $$(docker volume ls -q)
		docker system prune -a --force
		sudo rm -Rf $$HOME/ddata/mariadb
		sudo rm -Rf $$HOME/ddata/wordpress
		mkdir $$HOME/ddata/mariadb
		mkdir $$HOME/ddata/wordpress

re:
		@mkdir -p ../data/wordpress
		@mkdir -p ../data/mariadb
		@docker compose -f srcs/docker-compose.yml build
		docker compose -f srcs/docker-compose.yml up

.PHONY:	all up down ps fclean re

