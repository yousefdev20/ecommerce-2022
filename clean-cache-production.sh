#!/bin/bash

 if [ -d vendor ]
 then
    echo "the composer already installed."
 else
    docker exec ironApp composer install
 fi
#docker exec  ironApp php artisan key:generate
docker exec -it ironApp php artisan optimize:clear
docker exec -it ironApp php artisan route:cache
docker exec -it ironApp php artisan view:cache
docker exec -it ironApp php artisan config:cache
docker exec -it ironApp php artisan event:cache
docker exec -it ironApp php artisan storage:link
