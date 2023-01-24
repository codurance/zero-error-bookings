#!/bin/bash

set -e

psql -v ON_ERROR_STOP=1 -U "admin" -d "db" <<-EOSQL
  CREATE TABLE users (username VARCHAR ( 50 ) UNIQUE NOT NULL, password VARCHAR ( 50 ) NOT NULL);
  INSERT INTO users (username, password) VALUES ('user1', 'pass1');
  INSERT INTO users (username, password) VALUES ('user2', 'pass2');
  INSERT INTO users (username, password) VALUES ('user3', 'pass3');
  INSERT INTO users (username, password) VALUES ('user4', 'pass4');
EOSQL
