#!/bin/bash
apt-get update
apt-get install -y default-jre

java /tmp/spring-petclinic-rest-2.4.2.jar
