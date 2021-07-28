#!/bin/bash
apt-get update
apt-get install -y default-jre

java /tmp/artifacts/springpetclinic.jar

