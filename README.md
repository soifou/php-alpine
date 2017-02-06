# PHP CLI/FPM on Alpine Linux

## Tags
Versions and tags are based on PHP 5.x and 7.x versions.

The `cli` tag is designed to be used for command line stuff:
* `cli-7.1`
* `cli-7.0`
* `cli-5.6`

The `fpm` tag is designed to be used with PHP-FPM (and fit very well with an Alpine/Nginx docker image):
* `fpm-7.1`
* `fpm-7.0`
* `fpm-5.6`

## PHP extensions

These images are cooked with common PHP extensions:
```
bcmath
Core
ctype
curl
date
dom
fileinfo
filter
ftp
hash
iconv
intl
json
libxml
mbstring
mcrypt
mysqli
mysqlnd
opcache
openssl
pcre
PDO
pdo_mysql
pdo_sqlite
Phar
posix
readline
Reflection
session
SimpleXML
soap
SPL
sqlite3
standard
tokenizer
xml
xmlreader
xmlwriter
zip
zlib
```