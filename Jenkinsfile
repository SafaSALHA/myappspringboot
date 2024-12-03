node {
def mvnHome = tool 'maven-3.8.7'
def dockerImage
stage('Clone Repo') {
git “branch: 'main', url: 'https://github.com/SafaSALHA/myappspringboot.git'”
}
stage('Build Project') {
sh "mvn clean package"
}
stage('Build Docker Image') {
sh "docker build -t safa318/jenkins-image:v1.0 ."
}
stage('Deploy Docker Image'){
echo "Docker Image Tag "
sh "docker run --name devopsexample -d -p 2222:2222 safa318/jenkins-image:v1.0
}
}
