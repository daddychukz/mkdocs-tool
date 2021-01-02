pipeline {
	agent any 
	stages {
		stage('build') {
            // step to build the website
			steps {
				sh 'produce.sh'
			}
		}
		stage('test') {
            // step to serve the website
			steps {
				sh 'serve.sh'
			}
		}
	}
}