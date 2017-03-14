#!/bin/bash

ADMIN_PASSWORD=${ADMIN_PASSWORD:-admin123}
NEXUS_HOST=${NEXUS_HOST:-nexus.outlyer.com}

curl -v --user "admin:$ADMIN_PASSWORD" --upload-file ./site/target/mycompany.war \
                     http://$NEXUS_HOST/repository/broadleaf-cache/mycompany.war
curl -v --user "admin:$ADMIN_PASSWORD" --upload-file ./site/target/agents/spring-instrument.jar \
                            http://$NEXUS_HOST/repository/broadleaf-cache/spring-instrument.jar
curl -v --user "admin:$ADMIN_PASSWORD" --upload-file ./admin/target/admin.war \
                      http://$NEXUS_HOST/repository/broadleaf-cache/admin.war

shasum -a 256 ./site/target/mycompany.war 
shasum -a 256 ./site/target/agents/spring-instrument.jar
shasum -a 256 ./admin/target/admin.war 

