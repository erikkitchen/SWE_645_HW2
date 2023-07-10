pipeline {
    agent any

    script {
        currentVersion = sh(returnStdout: true, script: 'kubectl get deployment/gmustudentsurveydeploy -o jsonpath="{.spec.template.spec.containers[0].image}"').trim().split(':').last()
        newVersion = currentVersion.toInteger() + 1
        newImageTag = "erikkitchen/gmustudentsurvey:${newVersion}"
    }

    stages {
        stage('Create new war File') {
            steps {
                echo 'Building war file'
                git branch: 'main', url: 'https://github.com/erikkitchen/SWE_645_HW2.git'
                sh 'ls -la'
                sh 'rm -rf *.war'
                sh 'ls -la'
                sh 'jar -cvf Student_Survey.war -C ./ .'
                sh 'ls -la'
            }
        }
            
         stage('Build and push Student Survey image') {
            steps {
        echo 'Building Student Survey image'
        withCredentials([usernamePassword(credentialsId: 'DockerLogin', usernameVariable: 'DOCKERHUB_USER', passwordVariable: 'DOCKERHUB_PASS')]) {
            sh "docker login -u $DOCKERHUB_USER -p $DOCKERHUB_PASS"
             sh 'ls -la'
            sh "docker build -t ${newImageTag} ."
            echo 'pushing Student Survey image'
            sh "docker push ${newImageTag}"
                }
            }
        }
        
        
        stage('Deploy cluster') {
            steps {
                echo 'Deploy cluster through Rancher'
                sh 'kubectl config view'
				sh "kubectl get deployments"
                sh "kubectl set image deployment/gmustudentsurveydeploy gmustudentsurvey=${newImageTag}"
				//sh "kubectl set image deployment/gmustudentsurveydeploy gmustudentsurvey=erikkitchen/gmustudentsurvey:${env.BUILD_ID}"
                sh 'kubectl get services'
                sh 'kubectl get services -o wide'
                sh 'kubectl get nodes -o wide'
            }
        }
    }
}