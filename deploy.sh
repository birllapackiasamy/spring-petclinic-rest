#!/bin/bash
apt-get update
apt-get install -y default-jre
 
java -jar /tmp/artifacts/springpetclinic.jar


