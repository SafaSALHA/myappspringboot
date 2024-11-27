# Utiliser l'image officielle OpenJDK 17 comme base
FROM openjdk:17-jdk-slim-buster

# Exposer le port 2222 pour l'application
EXPOSE 2222

# Définir le répertoire de travail dans le conteneur
WORKDIR /app

# Copier le fichier JAR généré dans le conteneur
COPY target/myapp-0.0.1-SNAPSHOT.jar app.jar

# Spécifier la commande pour exécuter l'application au démarrage du conteneur
CMD ["java", "-jar", "app.jar"]
