pipeline {
    agent any
    
    environment {
        DEPLOY_SERVER = '13.201.222.58'  // Replace with your EC2 IP
        DEPLOY_USER = 'ubuntu'
        DEPLOY_PATH = '/home/ubuntu/DEPLOY'  // Change this to the desired path on the remote server
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'DEPLOY', url: 'https://github.com/ksabari04/dockerhost.git'
            }
        }
        
        stage('Deploy to EC2') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'ec2_deploy_passwd', usernameVariable: 'USER', passwordVariable: 'PASS')]) {
                    sh """
                    sshpass -p "\$PASS" ssh \$USER@${DEPLOY_SERVER} << 'EOF'
                    sudo mkdir -p ${DEPLOY_PATH}
                    sudo chown -R $USER:$USER ${DEPLOY_PATH}
                    """
                    sh """
                    sshpass -p "\$PASS" scp -r ./* ./.env \$USER@${DEPLOY_SERVER}:${DEPLOY_PATH}
                    """
                    sh """
                    sshpass -p "\$PASS" ssh -o StrictHostKeyChecking=no \$USER@${DEPLOY_SERVER} "
                        cd ${DEPLOY_PATH} &&
                        sudo docker-compose up --build -d
                    "
                    """
                   
                }
            }    
        }
    }    
}  
