# README

This docker image adds a non-root user to the official [amazon/aws-cli](https://hub.docker.com/r/amazon/aws-cli) image. To run the image as a non-root user:

```
docker run --rm -i \
  -v "${AWS_CONFIG_HOME:-$HOME/.aws}":/home/aws/.aws \
  -v "$(pwd)":/aws \
  --user "$(id -u):$(id -g)" \
  phelucko/aws-cli
```
