default: version
	./node_modules/.bin/knex

version: D := demo
version:
	DBNAME=$(D) ./node_modules/.bin/knex migrate:currentVersion

latest: D := demo
latest:
	DBNAME=$(D) ./node_modules/.bin/knex migrate:latest

make: D := demo
make: NAME := 
make: N ?= $(NAME)
make:
	DBNAME=$(D) ./node_modules/.bin/knex migrate:make $(N)

rollback: D := demo
rollback:
	DBNAME=$(D) ./node_modules/.bin/knex migrate:rollback

