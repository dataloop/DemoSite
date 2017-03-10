#!/bin/bash

ADMIN_PASSWORD = ${ADMIN_PASSWORD:-admin123}

curl -v --user "admin:$ADMIN_PASSWORD" --upload-file ./site/target/mycompany.war http://nexus.outlyer.com/repository/broadleaf-cache/mycompany.war
curl -v --user "admin:$ADMIN_PASSWORD" --upload-file ./admin/target/admin.war http://nexus.outlyer.com/repository/broadleaf-cache/admin.war

shasum -a 256 ./site/target/mycompany.war 
shasum -a 256 ./admin/target/admin.war 

