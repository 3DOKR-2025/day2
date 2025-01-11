# Générer le jar en utilisant un conteneur et le binaire installé sur votre pc (optionnel)
cd demo
docker run --rm \
  -v "$PWD:/app" \
  -w /app \
  gradle:8-jdk23 ./gradlew bootJar
cd ..

# Correction
docker build -t spring-boot-new-app .
docker run --name spring-boot-container2 --link spring-boot-container -p 8081:8080 -d spring-boot-new-app 
# le link est utilisée (mais déprécié) car la resolution dns ne fonctionne pas, il aurait fallu créer un réseau et mettre les deux conteneurs dedans
curl localhost:8081