.PHONY: status build start stop down restart shell dbshell migrate checkmigrate cli clean format

DOCKEREXECPY := docker exec -it blog-restapi python manage.py 
DOCKEREXEC := docker exec -it blog-restapi 

help:
	@echo "Blog API Commands"
	@echo -e "-------------------------------------------------------"
	@echo -e "- Run the Project \t\t > make start "
	@echo -e "- Stop the Project \t\t > make stop "
	@echo -e "- Remove the Running instance \t > make down "
	@echo -e "- Restart the Project \t\t > make restart "
	@echo -e "- Get the Project running status > make status "
	@echo -e "- Open Project Interactive shell > make cli "
	@echo -e "- Open Django Shell \t\t > make shell "
	@echo -e "- Open db shell \t\t > make dbshell "
	@echo -e "- Migrate the db changes \t > make migrate "
	@echo -e "- Check the Migration \t\t > make checkmigration "
	@echo -e "- Format the code \t\t > make format "
	@echo -e "- Clear the project \t\t > make clean "
	@echo -e "- "
	@echo -e "-------------------------------------------------------"

status:
	@docker-compose ps --all

build:
	@docker-compose build 

start: format
	@docker-compose up -d

stop:
	@docker-compose stop

down:
	@docker-compose down

restart: down start

shell:
	@$(DOCKEREXECPY) shell

dbshell:
	@$(DOCKEREXECPY) dbshell

migrate:
	@$(DOCKEREXECPY) migrate

checkmigration:
	@$(DOCKEREXECPY) 

createsuperuser:
	@$(DOCKEREXECPY) createsuperuser

cli:
	@$(DOCKEREXEC) bash

clean:
	@docker-compose down --remove-orphans --volumes
	@docker-compose rm --force
	@find . -name \*.pyc -delete

format:
	@black ./src