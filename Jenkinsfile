node
 {
  
  // def mavenHome = tool name: "maven3.6.2"
    def MavenHome= tool name: 'maven3.6.3'

  
      echo "GitHub BranhName ${env.BRANCH_NAME}"
      echo "Jenkins Job Number ${env.BUILD_NUMBER}"
      echo "Jenkins Node Name ${env.NODE_NAME}"
  
      echo "Jenkins Home ${env.JENKINS_HOME}"
      echo "Jenkins URL ${env.JENKINS_URL}"
      echo "JOB Name ${env.JOB_NAME}"
  
  properties([[$class: 'JiraProjectProperty'], buildDiscarder(logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '2', daysToKeepStr: '', numToKeepStr: '2')), pipelineTriggers([pollSCM('* * * * *')])])
   
  stage("1-Gitclone") {
        git branch: 'testing', url: 'https://github.com/Landmark25/maven-web-app.git'
        
    }
    stage("2-MavenBuild") {
        sh "${MavenHome}/bin/mvn clean package"
    }
    stage("3-CodeQuality") {
        sh "${MavenHome}/bin/mvn sonar:sonar"
    }
    stage("4-UploadArtifacts") {
        sh "${MavenHome}/bin/mvn deploy"
    }
    /*
    stage("5-DeployTomcat") {
        deploy adapters: [tomcat9(path: '', url: '')], contextPath: null, war: 'target/*war'
    }
     */
    stage("6-Email Notification"){
        emailext body: 'it was good. Approved', subject: 'BUILD SUCCESS', to: 'ademiluaayo94@gmail.com'  
        }
     stage("7-Approval") {
             timeout(time:8, unit:"HOURS"){
            input message: "Please this needs your approval"
        } 
     }
 }
  
  /*
  stage("CheckOutCodeGit")
  {
   git branch: 'development', credentialsId: '65fb834f-a83b-4fe7-8e11-686245c47a65', url: 'https://github.com/MithunTechnologiesDevOps/maven-web-application.git'
 }
 
 stage("Build")
 {
 sh "${mavenHome}/bin/mvn clean package"
 }
 
  /*
 stage("ExecuteSonarQubeReport")
 {
 sh "${mavenHome}/bin/mvn sonar:sonar"
 }
 
 stage("UploadArtifactsintoNexus")
 {
 sh "${mavenHome}/bin/mvn deploy"
 }
 
  stage("DeployAppTomcat")
 {
  sshagent(['423b5b58-c0a3-42aa-af6e-f0affe1bad0c']) {
    sh "scp -o StrictHostKeyChecking=no target/maven-web-application.war  ec2-user@15.206.91.239:/opt/apache-tomcat-9.0.34/webapps/" 
  }
 }
 
 stage('EmailNotification')
 {
 mail bcc: 'devopstrainingblr@gmail.com', body: '''Build is over

 Thanks,
 Mithun Technologies,
 9980923226.''', cc: 'devopstrainingblr@gmail.com', from: '', replyTo: '', subject: 'Build is over!!', to: 'devopstrainingblr@gmail.com'
 }
 */
 

