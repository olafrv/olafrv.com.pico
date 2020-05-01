name=olafrv-com-pico
image=olafrv/$name:latest
docker stop $name
docker rm $name
docker run -d --name $name -p 80:80 $image
