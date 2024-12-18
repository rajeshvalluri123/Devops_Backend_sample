pipeline {
    agent any

    tools {
        jdk "jdk17"
    }

    stages {
        stage('Build') {
            steps {
                // Clone the repository
                git 'https://github.com/rajeshvalluri123/Devops_Backend_sample.git'

                // Run Maven on the VM
                sh "mvn -Dmaven.test.failure.ignore=true clean package"
                
                // Run the application in the background
                sh "nohup java -jar target/stocktoship-0.0.1-SNAPSHOT.jar &"
                
                // Allow the application to run for a set amount of time (e.g., 1 minute), then kill the process
                               // Sleep for 60 seconds (1 minute)
                sh 'sleep 60'
                
                // Kill the background process
                sh ''' 
                    # Find the PID of the java process and kill it
                    PID=$(ps aux | grep "stocktoship-0.0.1-SNAPSHOT.jar" | grep -v grep | awk '{print $2}')
                    if [ -n "$PID" ]; then
                        kill $PID
                    else
                        echo "No process found to kill"
                    fi
                '''

            }
        }
    }
}
