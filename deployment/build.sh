# go to parent dir
cd ..
# build the project using mvn wrapper

./mvnw clean package

# push to nexus
./mvnw deploy

#build docker image

docker build -t adinafometescu/myapp:latest my-app

#here you can provide directly the credentials
docker login

docker push adinafometescu/myapp:latest
