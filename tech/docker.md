# Docker

## Setting it up

Get rid of `sudo`:

```
$ sudo groupadd docker # if necessary
$ sudo usermod -aG docker $USER
```

## Images

#### Pull and run an image

```bash
$ docker run -it -p 8888:8888 tensorflow/tensorflow:0.10.0rc0
```

#### Rename Image

```bash
$ docker tag docker.elastic.co/elasticsearch/elasticsearch:7.1.1  elastic
$ docker rmi docker.elastic.co/elasticsearch/elasticsearch:7.1.1
```

#### List all images

```bash
$ docker image ls
```

#### Remove images matching pattern

```bash
$ docker images -a | grep "pattern" | awk '{print $3}' | xargs docker rmi
```

## Containers

#### List All Processes

```bash
$ docker ps -a
```

or

```bash
$ docker container ls -a
```

Now you can restart a stopped container:

```bash
$ docker restart $container_id
```

#### Run a command in a new named container

```bash
$ docker run --name [name] [options] [image]
```

#### Detached Container

Run the container as a background process (a.k.a detached mode)

```bash
$ docker run -d [image]
```

#### Publish Port

```bash
$ docker run -p [host-port]:[container-port] [image]
```

#### Mount host volumes

```bash
$ docker run -v [host-path]:[container-path] [image]
```

#### Clean all containers

```bash
$ docker rm $(docker ps -aq)
```

#### Run command

```bash
$ docker exec -it <container name> <command>
```

#### Open up terminal

```bash

$ docker exec -it <container name> /bin/bash
```

#### Stop all containers

```bash
$ docker stop $(docker ps -aq)
```

#### Remove containers matching pattern

```bash
$ docker ps -a | grep "pattern" | awk '{print $1}' | xargs docker rm
```
