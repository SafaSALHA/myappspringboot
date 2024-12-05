node {
    def mvnHome = tool 'maven-3.8.7'
    
    stage('Clone Repo') {
        git branch: 'main', url: 'https://github.com/SafaSALHA/myappspringboot.git'
    }

    stage('Build Project') {
        sh "${mvnHome}/bin/mvn clean package"
    }

    stage('Build Docker Image') {
        sh "docker build -t safa318/jenkins-image:v1.0 ."
    }

    stage('Push Docker Image') {
        withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', 
                                          usernameVariable: 'DOCKER_USERNAME', 
                                          passwordVariable: 'DOCKER_PASSWORD')]) {
            sh '''
                echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin
                docker push safa318/jenkins-image:v1.0
                docker logout
            '''
        }
    }

    stage('Deploy Docker Image') {
        echo "Déploiement de l'image Docker..."
        sh "docker run --name devopsexample -d -p 2222:2222 safa318/jenkins-image:v1.0"
    }
}

