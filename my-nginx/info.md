Simple example of building a container image.

```shell
docker build -t my-nginx:0.1 .
docker run --rm --name my-nginx -d -p 8080:80 my-nginx:0.1
curl localhost:8080
docker stop my-nginx
```
