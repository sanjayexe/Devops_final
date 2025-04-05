pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'sanjay188/devops:latest'
    }

    stages {
        stage('Checkout Code') {
            steps {
                script {
                    sh 'git reset --hard origin/main'
                    sh 'git pull origin main'
                }
            }
        }

        stage('Debug Workspace') {
            steps {
                script {
                    sh 'pwd'     // Print current directory
                    sh 'ls -l'   // List files and folders
                }
            }
        }

        stage('Build and Push Docker Image') {
            steps {
                withCredentials([
                    usernamePassword(
                        credentialsId: 'sanjay T',       // This is the ID of your Docker Hub credential in Jenkins
                        usernameVariable: 'sanjay188',    // This will be available as $DOCKER_USERNAME
                        passwordVariable: 'virat@18vk'     // This will be available as $DOCKER_PASSWORD
                    )
                ]) {
                    script {
                        sh 'chmod +x deploy.sh'
                        sh './deploy.sh'
                    }
                }
            }
        }
    }
}
