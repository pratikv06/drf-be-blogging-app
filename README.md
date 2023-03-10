# Welcome! Blogging RestAPI in DRF
Django Rest Framework (DRF) Backend application for a blogging website

<img src="https://img.shields.io/github/downloads/pratikv06/drf-be-blogging-app/total" />  <img src="https://img.shields.io/github/license/pratikv06/drf-be-blogging-app" />



# Getting Started

To get started, you will need to clone this repository using your preferred git tool and remove the `.format` from both the `.env.format` and `.env.db.format` environment files and provide all of the values for the fields listed.
Next, ensure that you have docker and docker-compose are installed.
To execute the project, run the `make start` command and it will be accessible at `localhost:8000`

# Application Overview

In this application we have:

- A REST API written in Django Rest Framework (DRF).  
- Unit tests written in Pytest framework.

To be Implemented
- JWT for login authencation
- Email OTP account verification (in celery)
- Email OTP based password reset (in celery)

# Testing the Application
To test the application, the unit tests can be run via the command pytest in the project's root directory. 
Furthermore, we can obtain the test coverage result, which will show the percentage coverage.

# Commands
1. Install and Start Docker/Project:  
    ```
    docker-compose -f docker-compose.dev.yml build
    docker-compose -f docker-compose.dev.yml up
    ```
    or
    ```
    make build
    make start
    ```
2. Stop Docker/Project:
    ```
    docker-compose -f docker-compose.dev.yml stop
    ```
    or 
    ``` 
    make stop 
    ``` 
3. Remove the Container:
    ```
    docker-compose -f docker-compose.dev.yml down
    ```
    or 
    ```
    make down
    ```
4. Rebuild the container:
    ```
    docker-compose -f docker-compose.dev.yml down
    docker-compose -f docker-compose.dev.yml up
    ```
    or 
    ```
    make restart
    ```
5. Get the status of docker container:
    ```
    docker-compose -f docker-compose.dev.yml ps --all
    ```
    or
    ```
    make status
    ```
6. Open docker in interactive mode:
    ```
    docker exec -it blog-restapi bash
    ```
    or 
    ```
    make cli
    ```
7. Open Django interactive shell:
    ```
    docker exec -it blog-restapi python manage.py shell
    ```
    or 
    ```
    make shell
    ```
8. Open database interactive shell;
    ```
    docker exec -it blog-restapi python manage.py dbshell
    ```
    or
    ```
    make dbshell
    ```
9. Migrate the changes:
    ```
    docker exec -it blog-restapi python manage.py migrate
    ```
    or 
    ```
    make migrate
    ```
10. Check the migration changes (Fake migration):
    ```
    docker exec -it blog-restapi python manage.py migrate --fake
    ```
    or 
    ```
    make checkmigration
    ```
11. Format the python code using black formatter and sorting the import(local):
    ```
    isort -rc ./src
    black ./src
    ```
    or 
    ```
    make format
    ```
12. Remove the docker files:
    ```
    docker-compose down --remove-orphans --volumes
    docker-compose rm --force
    find . -name \*.pyc -delete
    ```
    or 
    ```
    make clean
    ```
