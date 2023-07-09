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
                sh 'kubectl --kubeconfig /var/lib/jenkins/.kube/config set image deployment/Cluster container-0=erikkitchen/gmustudentsurvey:latest'
                sh 'kubectl --kubeconfig /var/lib/jenkins/.kube/config rollout restart deployment/Cluster'
            }
        }
    }
}