docker rm -f $(docker ps -q -f name=wildfly-app)

docker build --tag=wildfly-app .

#docker run -i -p 8080:8080 wildfly-app &
docker run -p 8080:8080 -p 9990:9990 -d --name wildfly-app wildfly-app
sleep 30
curl -L http://localhost:8080/TestWeb/HelloServlet


