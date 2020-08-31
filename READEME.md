# REST API articles/authors

Example repo created to make REST API

steps to make test enviroment

## Requirements
```
> "php": ">=7.2.5"
> composer
```

### Steps to start

```
composer install
bin/console doctrine:database:create
bin/console doctrine:migrations:migrate
bin/console doctrine:fixtures:load
php -S 127.0.0.1:8000 -t public OR symfony server:start(if installed symfony)
```

### API Endpoints

- ```/api/articles``` - get all articles
- ```/api/articles/{id}``` - get article by Id
- ```/api/authors``` - get all authors 
	- Possible queries
		- limit - ex.```/api/authors?limit=3``` - gets only 3 authors
		- type,startDate,endDate - 
			ex.```?type=best&limit=3&startDate=2020-05-01&endDate=2020-08-01``` - select best authors who wrote most articles in certain period of time
            - if ```endDate``` is null it sets as now
            
- ```/api/authors/1``` - get author by id
- ```/api/authors/1/articles``` - get author articles by id

### Front part

Allow you to have simple bootstraped CRM where you can list articles/authors and add new/edit articles