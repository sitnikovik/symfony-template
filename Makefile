APP_CONTAINER_NAME = symfony_template

###> Docker ###
docker-build: # Сбилдить докер
	docker-compose build
docker-up: # Поднять докер
	docker-compose up -d
	docker exec -it ${APP_CONTAINER_NAME} symfony serve:start
docker-down: # Остановить докер
	docker-compose stop
docker-restart: docker-down docker-up # Перезапустить докер
###< Docker ###

###> PHP ###
composer-install: # Установить завимости PHP
	docker exec -it ${APP_CONTAINER_NAME} php composer.phar install
composer-update: # Обновить завимости PHP
	docker exec -it ${APP_CONTAINER_NAME} php composer.phar update
composer-require: # Подтянуть завимость PHP
	docker exec -it ${APP_CONTAINER_NAME} php composer.phar require $(v)
php: # Выполнить PHP
	docker exec -it ${APP_CONTAINER_NAME} php $(v)
###< PHP ###

###> Symfony ###
symfony-console: # Консоль Symfony
	docker exec -it ${APP_CONTAINER_NAME} php bin/console $(v)
symfony-make: # Мейкер Symfony
	docker exec -it ${APP_CONTAINER_NAME} php bin/console make:$(v)
symfony-clear-cache: # Очистить кэш Symfony
	docker exec -it ${APP_CONTAINER_NAME} php bin/console cache:clear
symfony-update-db-schema: # Обновить схему БД
	docker exec -it ${APP_CONTAINER_NAME} php bin/console doctrine:schema:update -f
###< Symfony ###

###> App ###
init: docker-build compile # Первый инит приложения
compile: composer-install # Собрать приложение
	npm install && npm run build
###< App ###