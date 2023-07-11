pipeline {
    agent any

    

    stages {
        stage('Create new war File') {
            steps {
                echo 'Building war file'
                git branch: 'main', url: 'https://github.com/erikkitchen/SWE_645_HW2.git'
                sh 'rm -rf *.war'
                sh 'jar -cvf Student_Survey.war -C ./ .'
            }
        }
            
         stage('Build and push Student Survey image') {
            steps {
        echo 'Building Student Survey image'
        withCredentials([usernamePassword(credentialsId: 'DockerLogin', usernameVariable: 'DOCKERHUB_USER', passwordVariable: 'DOCKERHUB_PASS')]) {
            sh "docker login -u $DOCKERHUB_USER -p $DOCKERHUB_PASS"
            sh "docker build -t erikkitchen/gmustudentsurvey:${env.BUILD_ID} ."
            echo 'pushing Student Survey image'
            sh "docker push erikkitchen/gmustudentsurvey:${env.BUILD_ID}"
                }
            }
        }
        
        
        stage('Deploy cluster') {
            steps {
                echo 'Deploy cluster through Rancher'
                sh 'kubectl config view'
                script {
                    // Check if the deployment already exists
                    def deploymentExists = sh(returnStdout: true, script: 'kubectl get deployments gmustudentsurveydeploy --no-headers --output=name').trim()
                    
                    // Use if statement to conditionally skip the deployment creation
                    if (deploymentExists) {
                        sh "kubectl set image deployment/gmustudentsurveydeploy gmustudentsurvey=erikkitchen/gmustudentsurvey:${env.BUILD_ID}"
                    } else {
                        // Create the deployment
                        sh "kubectl create deployment gmustudentsurveydeploy --image=erikkitchen/gmustudentsurvey:${env.BUILD_ID}"
                        sh "kubectl set image deployment/gmustudentsurveydeploy gmustudentsurvey=erikkitchen/gmustudentsurvey:${env.BUILD_ID}"

                    }
                }
                /*sh "kubectl create deployment gmustudentsurveydeploy --image=erikkitchen/gmustudentsurvey:${env.BUILD_ID}"
				sh "kubectl get deployments"
                sh "kubectl set image deployment/gmustudentsurveydeploy gmustudentsurvey=erikkitchen/gmustudentsurvey:${env.BUILD_ID}"*/

            }
        }
    }
}