docker build -t pypalkar23/docker-multi-client:latest -t pypalkar23/docker-multi-client:$GIT_SHA -f ./client/Dockerfile ./client
docker build -t pypalkar23/docker-multi-server:latest -t pypalkar23/docker-multi-server:$GIT_SHA -f ./server/Dockerfile ./server
docker build -t pypalkar23/docker-multi-worker:latest -t pypalkar23/docker-multi-worker:$GIT_SHA-f ./worker/Dockerfile ./worker

docker push pypalkar23/docker-multi-client:latest
docker push pypalkar23/docker-multi-server:latest
docker push pypalkar23/docker-multi-worker:latest
docker push pypalkar23/docker-multi-client:$GIT_SHA 
docker push pypalkar23/docker-multi-server:$GIT_SHA 
docker push pypalkar23/docker-multi-worker:$GIT_SHA 

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=pypalkar23/docker-multi-server:$GIT_SHA
kubectl set image deployments/server-deployment server=pypalkar23/docker-multi-client:$GIT_SHA
kubectl set image deployments/server-deployment server=pypalkar23/docker-multi-server:$GIT_SHA
