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
            
         stage('Build Student Survey image') {
            steps {
                echo 'Building Student Survey image'
                sh "docker login -u erikkitchen -p ${DOCKERHUB_PASS}"
                sh 'docker build -t erikkitchen/gmustudentsurvey:latest .'
            }
        }
        
        stage('Push Student Survey image') {
            steps {
                echo 'Building Student Survey image'
                sh 'docker push erikkitchen/gmustudentsurvey:latest'
            }
        }
        
        stage('Deploy cluster') {
            steps {
                echo 'Deploy cluster through Rancher'
                sh 'kubectl --kubeconfig /var/lib/jenkins/.kube/config set image deployment/gmustudentsurvey container-0=erikkitchen/gmustudentsurvey:latest'
                sh 'kubectl --kubeconfig /var/lib/jenkins/.kube/config rollout restart deployment/gmustudentsurvey'
            }
        }
    }
}