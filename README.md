A Docker image that allows to quickly setup minimal LAMP stack for installing basic [GPLCart shopping cart](https://github.com/gplcart/gplcart)

Run container:

    docker-compose up

Point your browser to `http://localhost:8080` or `http://192.168.99.100:8080` (Windows) and perform full installation

- Database name: `test`
- Database user: `root`
- Database password: `test`

If you're on Windows, replace default database host with your current IP (most likely 192.168.99.100)
