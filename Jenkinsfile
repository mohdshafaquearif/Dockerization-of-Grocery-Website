pipeline {
    agent any

    environment {
        IMAGE_NAME = "shafaque26/grocery-website"
        CONTAINER_NAME = "grocery-container"
        REPO_URL = "https://github.com/mohdshafaquearif/Dockerization-of-Grocery-Website.git"
        KUBE_DEPLOYMENT = "deployment.yaml"
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: "${REPO_URL}"
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t ${IMAGE_NAME}:latest ."
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    sh "echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin"
                    sh "docker push ${IMAGE_NAME}:latest"
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                script {
                    sh "kubectl apply -f ${KUBE_DEPLOYMENT}"
                }
            }
        }
    }

    post {
        success {
            echo "Deployment Successful! Access the site via Kubernetes."
        }
        failure {
            echo "Build, push, or deployment failed. Check the logs for details."
        }
    }
}
