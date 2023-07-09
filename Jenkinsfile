pipeline {
    agent any

    stages {
        stage('Create new war File') {
            steps {
                echo 'Building war file'
                git branch: 'main', url: 'https://github.com/erikkitchen/SWE_645_HW2.git'
                sh 'rm -rf *.war'
                sh 'jar -cvf Student_Survey.war -C ${WORKSPACE}/ .'
            }
        }
            
         stage('Build and push Student Survey image') {
            steps {
        echo 'Building Student Survey image'
        withCredentials([usernamePassword(credentialsId: 'DockerLogin', usernameVariable: 'DOCKERHUB_USER', passwordVariable: 'DOCKERHUB_PASS')]) {
            sh "docker login -u $DOCKERHUB_USER -p $DOCKERHUB_PASS"
            sh 'docker build -t erikkitchen/gmustudentsurvey:latest .'
            echo 'pushing Student Survey image'
            sh 'docker push erikkitchen/gmustudentsurvey:latest'
                }
            }
        }
        
        
        stage('Deploy cluster') {
            steps {
                echo 'Deploy cluster through Rancher'
                /*sh 'kubectl get deployments --kubeconfig /var/lib/jenkins/.kube/config'
                sh 'kubectl --kubeconfig /var/lib/jenkins/.kube/config set image deployment/cluster container-0=erikkitchen/gmustudentsurvey:latest'
                sh 'kubectl --kubeconfig /var/lib/jenkins/.kube/config rollout restart deployment/cluster'*/
                //sh 'kubectl create deployment gmustudentsurveydeploy --image=erikkitchen/gmustudentsurvey'
                sh 'kubectl config view'
				sh "kubectl get deployments"
				sh "kubectl set image deployment/gmustudentsurveydeploy gmustudentsurvey=erikkitchen/gmustudentsurvey:${env.BUILD_ID}"
                sh 'kubectl get services'
                sh 'kubectl get services -o wide'
            }
        }
    }
}