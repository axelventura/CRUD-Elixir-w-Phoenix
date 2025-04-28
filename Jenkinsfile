pipeline {
    agent any
    environment {
        DOCKER_COMPOSE_FILE = 'docker-compose.yml'
    }
    stages {
        stage('Clonar') {
            steps {
                git url: 'https://github.com/axelventura/CRUD-Elixir-w-Phoenix.git', branch: 'main'
            }
        }
        stage('Build') {
            steps {
                script {
                    sh "docker-compose -f ${DOCKER_COMPOSE_FILE} build"
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    sh "docker-compose -f ${DOCKER_COMPOSE_FILE} down"
                    sh "docker-compose -f ${DOCKER_COMPOSE_FILE} up -d --build"
                    sh "docker ps"
                    sh "docker-compose -f ${DOCKER_COMPOSE_FILE} logs"
                }
            }
        }
    }
}
