cd spring-boot/demo
docker run --rm \
  -v "$PWD:/app" \
  -w /app \
  gradle:8-jdk23 ./gradlew bootJar
cd ../..
docker compose up

#Spring Boot :
curl http://localhost:8080
curl http://localhost:8080/express

#Express :
curl http://localhost:3000

# Flask :
curl http://localhost:5000
curl http://localhost:5000/postgres