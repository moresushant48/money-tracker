pipeline {
    agent any

    stages {
        stage('GIT PULL') {
            steps {
                git branch: "master", url: 'https://github.com/moresushant48/money-tracker.git'
            }
        }
        stage('TEST') {
            steps {
                sh 'flutter test'
            }
        }
        stage('BUILD') {
            steps {
                sh '''
                  #!/bin/sh
                  flutter build apk --release
                  '''
            }
        }
    }
}