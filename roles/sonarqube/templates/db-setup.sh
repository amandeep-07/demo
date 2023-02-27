#!/bin/bash

CREATE USER sonarqube ;
echo "CREATE USER sonarqube WITH PASSWORD 'Password'; CREATE DATABASE sonarqube OWNER sonarqube; GRANT ALL PRIVILEGES ON DATABASE sonarqube TO sonarqube; \q" | sudo -u postgres psql;