node {
  def mavenHome = tool name: 'Maven 3.8.2'
  stage('1-GitClone') {
    git branch: 'development', url: 'https://github.com/Landmark25/maven-web-app.git'
  }
  stage('2-Mavenbuild') { sh "${mavenHome}/bin/mvn clean package"

  }
  stage('3-Codequality') { sh "${mavenHome}/bin/mvn sonar:sonar"

  }
  stage('4-UploadArtifacts') { sh "${mavenHome}/bin/mvn deploy"

  }
  stage('5-DeployTomcat') { deploy adapters: [tomcat9(credentialsId: 'Tomcat-Demo', path: '', url: 'http://54.163.53.60:8080/')], contextPath: null, war: 'target/*war'

  }
  stage('6-EmailNotification') { mail bcc: '', body: '''Hi Everyone

We have successfully built the project.

Thanks to everyone that made it a success 

Ayo Ademilua''', cc: '', from: '', replyTo: '', subject: 'Ebay Pipeline Project', to: 'ayo.ademilua54@gmail.com'

  }
}

