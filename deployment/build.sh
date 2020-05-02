if [ -z "$1" ]; then
    echo "Versioning: ERROR: Deploy version not set" 1>&2
    exit 1
fi
# go to parent dir
cd ..
# build the project using mvn wrapper
VERSION=$1
./mvnw versions:set -DnewVersion="${VERSION}-SNAPSHOT"

./mvnw clean package

# push to nexus
./mvnw deploy -Dmaven.test.skip=true

#build docker image

docker build -t adinafometescu/myapp:$VERSION my-app

#here you can provide directly the credentials
docker login

docker push adinafometescu/myapp:$VERSION

kubectl set image deployment/myapp-deployment myapp=adinafometescu/myapp:$VERSION --record

kubectl rollout status deployment/myapp-deployment