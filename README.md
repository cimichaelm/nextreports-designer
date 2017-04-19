# DOCKER NEXTREPORTS DESIGN 9.1

Use this docker image to run the application without installing anything in your computer!

Requirements:

1) X11 server installed in your host computer, for OS X install latest [XQuartz](https://www.xquartz.org/).

2) Then, allow connections from your host machine.

Get the host ip address
```
ip=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')
```

Allow connections running xhost command

```
xhost + $ip
```

Now, you can run it!

```
docker run --rm -it -p 8083:8083 -e DISPLAY=$ip:0 -v /tmp/.X11-unix:/tmp/.X11-unix gpalli/nextreports-designer
```
Map local files to image volume files to save settings

```
-v $(pwd)/server-prod.ds-next:/root/server-prod.ds-next
```

Greetings!!!.
