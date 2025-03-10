pipeline {
    agent any

    environment {
        IMAGE_NAME = "my-html-site"
        CONTAINER_NAME = "html-container"
        REPO_URL = "https://github.com/mohdshafaquearif/Dockerization-of-Grocery-Website.git"  
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
                    sh "docker build -t ${IMAGE_NAME} ."
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    // Stop and remove any existing container
                    sh """
                    docker stop ${CONTAINER_NAME} || true
                    docker rm ${CONTAINER_NAME} || true
                    """

                    // Run the new container
                    sh "docker run -d -p 8080:80 --name ${CONTAINER_NAME} ${IMAGE_NAME}"
                }
            }
        }
    }

    post {
        success {
            echo "Deployment Successful! Access the site at http://localhost:8080"
        }
        failure {
            echo "Build or deployment failed. Check the logs for details."
        }
    }
}
