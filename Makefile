default: version
	./node_modules/.bin/knex

version: D := test
version:
	DBNAME=$(D) ./node_modules/.bin/knex migrate:currentVersion

latest: D := test
latest:
	DBNAME=$(D) ./node_modules/.bin/knex migrate:latest

make: D := test
make: NAME := 
make: N ?= $(NAME)
make:
	DBNAME=$(D) ./node_modules/.bin/knex migrate:make $(N)

rollback: D := test
rollback:
	DBNAME=$(D) ./node_modules/.bin/knex migrate:rollback

