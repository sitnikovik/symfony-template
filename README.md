# symfony-template

Базовый шаблон приложения на Symfony с докером, PHP8.2, npm

## Инит проекта

- Собрать докер-контейнер
- Обновить конфиг приложения
- Установить PHP-зависимости
- Установить JS-зависимости

```shell
make init
```

## Команды

### Приложение

Первичный инит
```shell
make init
```

Компиляция
```shell
make compile
```

Запуск
```shell
make docker-up
```

### Docker

Собрать контейнер
```shell
make docker-build
```

Поднять контейнер
```shell
make docker-up
```

Остановить контейнер
```shell
make docker-stop
```

Перезапустить контейнер
```shell
make docker-restart
```

### PHP

Установить зависимости
```shell
make composer-install
```

Обновить зависимости
```shell
make composer-update
```

Подтянуть завимость
```shell
make composer-require v="some_package"
```

Выполнить PHP
```shell
make php v="some_package"
```

### Symfony

Генерация сущности
```shell
make symfony-make v="entity"
```

Генерация CRUD. Создат контроллер, форму, шаблоны. Для работы уже должна быть сущность.
```shell
make symfony-make v="crud"
```

Генерация контроллера
```shell
make symfony-make v="controller"
```

Генерация формы
```shell
make symfony-make v="form"
```

Генерация CLI-команды
```shell
make symfony-make v="command"
```

Генерация валидатора
```shell
make symfony-make v="validator"
```

Генерация вотера
```shell
make symfony-make v="voter"
```

### Базы данных

Обновить схему БД SQL
```shell
make symfony-update-db-schema
```