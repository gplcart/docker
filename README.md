This is a simple set of dockers for running a local <a href="https://github.com/gplcart/gplcart">GPLCart</a> LAMP. The base image allows you to install Debian 8, PHP 7, Apache 2 and download GPLCart source from Github.

To run a container locally

1. `cd` to Dockerfile's directory
2. `docker build -t test .`
3. `docker run --name test -d -p 8080:80 test`

To pull from [repository](https://hub.docker.com/r/gplcart/core)

1. `docker pull gplcart/core`
2. `docker run --name test -d -p 8080:80 gplcart/core`

To perform a full store installation you'll need a working database container which can be linked in `docker run` command
but there is a better alternative using `docker-compose up` command:

1. Locally: `docker-compose up -d`
2. From repository: `docker-compose up -d gplcart/core`

The command will set up all required environment including working database (MariaDB) and PHPMyAdmin so you don't need to build/run containers separately

**URLs**

- Web installer: `http://localhost:8080`
- PHPMyAdmin: `http://localhost:8181`

**Database**

- User: **root**
- Password: **test**
- Name: **test**
- Port: 3306
- Host: **db** (WIN users - use your current IP, e.g **192.168.99.100**)

**Container variables**

- GPLCART_VER - core version (defaults to 'dev')
- GPLCART_URL - download URL (defaults to 'https://github.com/gplcart/gplcart/archive/[version number].tar.gz')
