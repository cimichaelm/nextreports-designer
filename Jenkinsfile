
//
// define variables
//
// downstream jobs
def downstreamjobs = [ 'docker-emailbot', 'docker-abppyurs' ]

pipeline {
  environment {
    tag = "$GIT_BRANCH"
    imagenamebase = "cimichaelm/nextreports-designer"
    imagename = "${imagenamebase}:${tag}"
    registry = "cimichaelm/nextreports-designer'
    registryCredential = ''
    dockerImage = ''
    dockerregistry=''
    dockercredential=''
  }
  agent any
  stages {
//    stage('Cloning Git') {
//      steps {
//        git ''
//      }
//    }
    stage('Building image') {
      steps{
        script {
	  docker.withRegistry("${env.dockerregistry}") {
            dockerImage = docker.build("${env.imagename}")
	  }
        }
      }
    }
    stage('Deploy Image') {
      steps{
        script {
	   docker.withRegistry("${env.dockerregistry}") {
	      dockerImage.push("${env.tag}")
	   }
        }
      }
    }
    stage('Remove Unused docker image') {
      steps{
        sh "docker rmi ${env.imagename}"
      }
    }
  }
  post {
       success {
            script {
	        if ("${env.BRANCH_NAME}" =~ /^(develop)|(v\d+)$/) {
		    for (jobname in downstreamjobs) {
		       echo "Triggering job for branch ${env.BRANCH_NAME}"
                       BRANCH_TO_TAG=env.BRANCH_NAME.replace("/","%2F")
                       build job: "../${jobname}/${BRANCH_TO_TAG}", wait: false
		    }
		}
            }
        }
  }
}