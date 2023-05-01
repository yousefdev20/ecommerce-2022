
# Ecommerce

Ecommerce system
"ecommerce" (BACKEND)
``` 
laravel -v 8.82.0
php -v  8.1.4
 ```
### Maintainer
```
(Yousef)
```

### Implementation Note
```
ARCHITECTURE
 
```
#### You can use artisan command on server what is useful artisan command in laravel (high recommend)
``` bash
1. clean cache, view, routes, config type:
   php artisan optimize:clear
2. clear the logs files. (custom command)
   php artisan log:clear
3. to migrate database only type this command. (just in first time)
   php artisan migrate
4. if do you like take backup from database structure type this command.
   php artisan migrate:generate
5. store all config file, routing, view, cache. (high recommend)
   php artisan route:cache
   php artisan config:cache
   php artisan view:cache
   
composer update
if do you like upgrade packages and laravel framework  
composer install
if the vendor does not exist
 npm install
if the node_modal does not exist
### serve application on any empty port.
```
