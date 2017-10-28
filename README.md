This is a simple set of dockers for running a local [GPLCart](https://github.com/gplcart/gplcart) LAMP. The base image allows you to install Debian 8, PHP 7, Apache 2 and download GPLCart source from Github.

To run a container locally

1. `cd` to Dockerfile's directory
2. `docker build -t test .`
3. `docker run --name test -d -p 8080:80 test`

To pull from Docker Hub

1. `docker pull gplcart/core`
2. `docker run --name test -d -p 8080:80 gplcart/core`

To perform a full store installation you'll need a working database container which can be linked in `docker run` command
but there is a better alternative using `docker-compose up` command:

1. Create an empty project directory. This directory is the context for your application image. The directory should only contain resources to build that image.
2. Put there `docker-compose.yml` from [GitHub](https://github.com/gplcart/docker-core)
2. Change directories into your project directory `cd your-project-directory`
3. Run `docker-compose up -d`. It will set up all required environment including working database (MariaDB) and PHPMyAdmin so you don't need to build/run containers separately

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
