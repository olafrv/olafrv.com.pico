name=olafrv-com-pico
image=olafrv/$name:1.0.2

docker login
docker build -t $image .
docker push $image 

# docker stop $name
# docker rm $name
# docker run -d --name $name -p 80:80 $image
