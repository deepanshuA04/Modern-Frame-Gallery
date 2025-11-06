pipeline {
    agent any

    environment {
        // Use your real credential ID here 👇
        DOCKERHUB_CREDENTIALS = credentials('a770410e-e187-4471-ac23-fcff1d67da43')
        IMAGE_NAME = 'deepanshua04/modern-gallery'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/deepanshuA04/Modern-Frame-Gallery.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat '''
                echo Building Docker Image...
                cd app
                docker build -t %IMAGE_NAME%:latest .
                '''
            }
        }

        stage('Push Docker Image') {
            steps {
                bat '''
                echo Pushing Docker Image to DockerHub...
                echo %DOCKERHUB_CREDENTIALS_PSW% | docker login -u %DOCKERHUB_CREDENTIALS_USR% --password-stdin
                docker push %IMAGE_NAME%:latest
                '''
            }
        }

        stage('Deploy GREEN Environment') {
            steps {
                bat '''
                echo Deploying GREEN environment...
                bash scripts/deploy_green.sh
                '''
            }
        }

        stage('Smoke Test') {
            steps {
                bat '''
