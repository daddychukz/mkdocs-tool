pipeline {
	agent any 
	stages {
		stage('build') {
			steps {
				sh 'produce.sh'
			}
		}
		stage('test') {
			steps {
				sh 'serve.sh'
			}
		}
	}
}