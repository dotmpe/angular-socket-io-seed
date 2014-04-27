default: version
	./node_modules/.bin/knex

version:
	./node_modules/.bin/knex migrate:currentVersion

latest:
	./node_modules/.bin/knex migrate:latest

make: N := 
make:
	./node_modules/.bin/knex migrate:make $(N)

rollback:
	./node_modules/.bin/knex migrate:rollback
