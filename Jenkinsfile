pipeline {
    agent any
    tools {
        maven 'Maven 3'
    }
    stages {
        stage('Build Maven'){
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/sumant7654/Messaging-Service']])
                sh 'mvn clean install'
            }
        }

        stage('Build Docker Image'){
            steps {
                script {
                    sh 'docker build -t sumant7654/messaging-service .'
                }
            }
        }

        stage('Push Docker Image'){
            steps {
                script {
                    withCredentials([string(credentialsId: 'dockerhub-pwd', variable: 'DOCKERHUB_PASSWORD')]) {
                        sh 'docker login -u sumant7654 -p ${DOCKERHUB_PASSWORD}'
                    }
                    sh 'docker push sumant7654/messaging-service'
                }
            }
        }

        stage('Run on Docker Container'){
            steps {
                script {
                    sh 'docker run -it -d -p 8083:8083 sumant7654/messaging-service'
                }
            }
        }
    }
}