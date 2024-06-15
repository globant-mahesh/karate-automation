pipeline {
    agent any
    parameters {
      choice choices: ['local', 'staging', 'prod'], description: 'Karate config file env', name: 'karate.env'
      choice choices: ['@SmokeTest', '@RegressionTest', '@E2E'], description: 'Karate feature filtering tags', name: 'tags'
      choice choices: ['com/api/automation/e2e'], description: 'Karate features directory', name: 'testDir'
    }
    stages {
        stage('Cleanup') {
            steps {
                //
                bat 'echo Cleanup'
                cleanWs()
            }
        }
        stage('Checkout') {
            steps {
                //
                bat 'echo Checkout'
                checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/globant-mahesh/karate-automation.git']])
            }
        }
        stage('Build') {
            steps {
                //
                bat 'echo Checkout'
                bat 'mvn clean compile'
            }
        }
        stage('Test Execution') {
            steps {
                //
                bat 'echo "Test Execution"'
                bat 'mvn test -DtestDir=%testDir% -Dtags=%tags% -Dkarate.env=%karate.env%'
            }
        }
    }
    post {
        always {
        // One or more steps need to be included within each condition's block.
        cucumber buildStatus: 'UNCHANGED', customCssFiles: '', customJsFiles: '', failedFeaturesNumber: -1, failedScenariosNumber: -1, failedStepsNumber: -1, fileIncludePattern: '**/*.json', jsonReportDirectory: 'target/karate-reports', pendingStepsNumber: -1, reportTitle: 'Cucumber Report', skippedStepsNumber: -1, sortingMethod: 'ALPHABETICAL', undefinedStepsNumber: -1
        zip zipFile:'target/test-result.zip', archive: true, dir: 'target/surefire-reports', overwrite: true
                    emailext subject: "Job '${env.JOB_NAME} - ${env.BUILD_NUMBER} '", body: 'Refer to the attachment', attachmentsPattern: 'target/test-result.zip', to: 'user2@autoreply.com'
        }
    }
}