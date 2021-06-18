#!/bin/bash
curl -H Metadata-Flavor:Google http://metadata/computeMetadata/v1/instance/id -o /var/www/info/index.html
chown www-data /var/www/info/index.html
