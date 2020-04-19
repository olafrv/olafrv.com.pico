#sudo usermod -aG docker ${USER}
#docker login
image=olafrv/olafrv-com-pico:latest
docker build -t $image .
#docker push $image 
