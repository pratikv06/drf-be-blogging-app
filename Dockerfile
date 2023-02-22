# Base File python 3
FROM python:3.10.9

# set environment variable
ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1

# setting arg value, updating and installing postgres dependencies
ARG buildmode
ARG APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y \
    build-essential \
    libpq-dev && \
    rm -rf /var/lib/apt/lists/* 

# set work directory
WORKDIR /src/app

# install dependencies
COPY requirements.txt .
RUN pip install -r requirements.txt

# Setup entrypoint 
COPY docker-entrypoint.sh .
RUN chmod a+x ./docker-entrypoint.sh
ENTRYPOINT ["./docker-entrypoint.sh"]

# copy project
COPY ./src/ .

# Expose port for local access
EXPOSE 8000