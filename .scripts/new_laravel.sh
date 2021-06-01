#!/bin/sh

# composer global require laravel/installer
project_name="travel"
composer create-project laravel/laravel $project_name
cd $project_name || exit

### DATABASE
# touch database/database.sqlite
vim .env # edit user and password
doas vim /etc/php/php.ini #uncomment /extenstion=pdo
mysql -u root -p
```
CREATE USER 'hassan'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON *.* TO 'hassan'@'localhost';
FLUSH PRIVILEGES;
create database $project_name;
```
php artisan storage:link

### AUTH
composer require laravel/ui --dev
php artisan ui vue --auth
npm install && npm run dev # (2 times)
php artisan migrate:fresh

### USER
vim resources/views/home.blade.php #user after login
vim resources/views/auth/register.blade.php  # regitration form
vim app/Http/Controllers/Auth/RegisterController.php #
vim database/migrations/*_create_users_table.php # database column connection
vim app/Models/User.php #add protected

### PROFILE (user has one profile)
php artisan make:controller ProfilesController
php artisan make:model Profile -m
php artisan migrate
vim database/migrations/*_create_profiles_table.php # database column connection
php artisan migrate
vim app/Models/Profile.php
vim app/Models/User.php
mkdir resources/views/profiles
mv resources/views/home.blade.php resources/views/profiles/index.blade.php
vim app/Http/Controllers/ProfilesController.php #


### TEMPLATE
vim resources/views/layouts/app.blade.php # topbar

### posts (user has many posts)
php artisan make:model Post -m
vim database/migrations/*_create_posts_table.php
php artisan migrate
vim app/Models/User.php
vim app/Models/Post.php
vim routes/web.php
php artisan make:controller PostsController
vim app/Http/Controllers/PostsController.php #
mkdir resources/views/posts
vim resources/views/posts/create.blade.php
vim resources/views/posts/show.blade.php


### POLICY
php artisan make:policy ProfilePolicy -m Profile
vim app/Policies/ProfilePolicy.php



### General
Post::truncate(); #delete all posts
php artisan route:clear

### FOLLOW
php artisan make:controller FollowsController
mv resources/js/components/ExampleComponent.vue  resources/js/components/FollowButton.vue
vim resources/js/components/FollowButton.vue
vim resources/js/app.js 
npm run dev
vim app/Http/Controllers/FollowsController.php 
php artisan make:migration creates_profile_user_pivot_table --create profile_user
vim database/migrations/*_creates_profile_user_pivot_table.php 
php artisan migrate
vim app/Models/User.php
vim app/Models/Profile.php



### MAIL
php artisan make:mail NewUserWelcomeMail -m emails.welcome-email
vim resources/views/emails/welcome-email.blade.php 

 composer dump-autoload
 composer dump-autoload -o
 php artisan clear-compiled
 php artisan optimize

 php artisan route:clear
 php artisan view:clear

 php artisan config:clear
 php artisan config:cache
 php artisan cache:clear
 php artisan migrate:fresh
  
### COUNTRY
php artisan make:model Country
php artisan make:model City
php artisan make:migration create_country_city_tables
php artisan make:controller CountryCityController

composer require phpmyadmin/phpmyadmin


curl -d "email=john@doe.com&password=password" -X POST http://127.0.0.1:8000/api/login
curl -d "id=1" -X GET http://127.0.0.1:8000/api/bots



