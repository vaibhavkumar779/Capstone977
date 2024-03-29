void setBuildStatus(String message, String state) {
  step([
      $class: "GitHubCommitStatusSetter",
      reposSource: [$class: "ManuallyEnteredRepositorySource", url: "https://github.com/vaibhavkumar779/Capstone977"],
      contextSource: [$class: "ManuallyEnteredCommitContextSource", context: "ci/jenkins/build-status"],
      errorHandlers: [[$class: "ChangingBuildStatusErrorHandler", result: "UNSTABLE"]],
      statusResultSource: [ $class: "ConditionalStatusResultSource", results: [[$class: "AnyBuildResult", message: message, state: state]] ]
  ]);
}
pipeline {
  agent any
   environment {
      dockerhub=credentials('dockerhub')
      GITHUB_API_URL='https://api.github.com/users/vaibhavkumar779/repos/vaibhavkumar779/Capstone977'      
   }
  options {
    buildDiscarder(logRotator(numToKeepStr: '5', daysToKeepStr: '5'))
    timestamps() 
    timeout(time: 20, unit: 'MINUTES') 
  }
  
  stages {  



    stage('Setup') { 
      steps {
        echo 'BRANCH NAME: ' + env.BRANCH_NAME
        echo sh(returnStdout: true, script: 'env')
        sh " pip3 install -r requirements.txt "
      }
    }
    
    stage('Testing') { 
      steps {
        script {
          sh """
          python3 -m pylint -E **/*.py \n
          echo completed TESTING SUCESSFULL
          """
        }
      }
      //steps {
      //    sh """
      //    python3 -m pytest
      //    """
      //}
    }

    stage(" build image archive"){
      steps{
      sh "python3 -m build"
    }
    }
    
    stage("building docker image"){

      when {
        branch 'main'
      }

      steps{
        sh 'docker build -t capstone:${GIT_COMMIT} .'
          
        }    
    }

    stage("Pushing the docker image"){

      when {
        branch 'main'
      }

      steps{
        sh 'echo $dockerhub_PSW | docker login -u $dockerhub_USR --password-stdin'
        sh 'docker tag capstone:${GIT_COMMIT} vaibhavkuma779/flaskappcapstone:${GIT_COMMIT}'
        sh 'docker push  vaibhavkuma779/flaskappcapstone:${GIT_COMMIT}'
        sh 'docker tag capstone:${GIT_COMMIT} vaibhavkuma779/flaskappcapstone:latest'
        sh 'docker push  vaibhavkuma779/flaskappcapstone:latest'
      }
    }

    stage("Deploying"){

      when {
        branch 'main'
      }
      
      steps{
        
        withKubeConfig([credentialsId: 'kubernetes']){
          
          sh 'kubectl delete namespace vaibhav'
          sh 'kubectl create namespace vaibhav'
          sh 'kubectl apply -f kubernetes/mongodb/mongodb.yml'
          sh 'kubectl apply -f kubernetes/app/deployment.yml'
          sh 'kubectl apply -f kubernetes/app/nodeport.yml'
        }
      }
    }
    

  }
  post{

        success{
          archiveArtifacts allowEmptyArchive: true, artifacts: '**/*.whl', onlyIfSuccessful: true
          cleanWs()
    setBuildStatus("Build succeeded", "SUCCESS");
    }
    failure {
        setBuildStatus("Build failed", "FAILURE");
    }
  }
  
        
    
} 
