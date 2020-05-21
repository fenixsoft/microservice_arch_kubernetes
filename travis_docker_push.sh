#!/bin/bash
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

# gateway
cd ./bookstore-microservices-platform-gateway/
docker build -t bookstore-springcloud:platform-gateway .
docker tag bookstore-springcloud:platform-gateway $DOCKER_USERNAME/bookstore-kubernetes/platform-gateway
cd ..

# security
cd ./bookstore-microservices-domain-security/
docker build -t bookstore-springcloud:domain-security .
docker tag bookstore-springcloud:domain-security $DOCKER_USERNAME/bookstore-kubernetes/domain-security
cd ..

# account
cd ./bookstore-microservices-domain-account/
docker build -t bookstore-springcloud:domain-account .
docker tag bookstore-springcloud:domain-account $DOCKER_USERNAME/bookstore-kubernetes/domain-account
cd ..

# warehouse
cd ./bookstore-microservices-domain-warehouse/
docker build -t bookstore-springcloud:domain-warehouse .
docker tag bookstore-springcloud:domain-warehouse $DOCKER_USERNAME/bookstore-kubernetes/domain-warehouse
cd ..

# payment
cd ./bookstore-microservices-domain-payment/
docker build -t bookstore-springcloud:domain-payment .
docker tag bookstore-springcloud:domain-payment $DOCKER_USERNAME/bookstore-kubernetes/domain-payment
cd ..

docker images
docker push $DOCKER_USERNAME/bookstore-kubernetes/platform-gateway
docker push $DOCKER_USERNAME/bookstore-kubernetes/domain-security
docker push $DOCKER_USERNAME/bookstore-kubernetes/domain-account
docker push $DOCKER_USERNAME/bookstore-kubernetes/domain-warehouse
docker push $DOCKER_USERNAME/bookstore-kubernetes/domain-payment
