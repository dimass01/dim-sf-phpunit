PHP_SERVICE := php

build:
	@docker-compose build

up:
	@docker-compose up -d

composer:
	@docker-compose exec -T ${PHP_SERVICE} composer install

db-create:
	@docker-compose exec ${PHP_SERVICE} bin/console doctrine:database:create

db-schema-create:
	@docker-compose exec ${PHP_SERVICE} bin/console doctrine:schema:create --dump-sql

db-update:
	@docker-compose exec -T ${PHP_SERVICE} bin/console doctrine:schema:update --force

install:
	@make -s build
	@make -s up
	@make -s composer
	@make -s db-created
	@make -s db-schema-create
	@make -s db-updater
