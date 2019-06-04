properties([
                parameters([booleanParam(defaultValue: false, description: 'Create a release', name: 'release')]),
                buildDiscarder(logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '', daysToKeepStr: '', numToKeepStr: '10')),
                disableConcurrentBuilds(),
                pipelineTriggers([
                                    pollSCM('H/2 * * * *'),
                                    cron('@weekly')
                                 ])
              ])


node {

   jdk = tool name: 'OpenJDK 11', type: 'jdk'
   env.JAVA_HOME = "${jdk}"


   stage ("checkout") {
        //checkout scm
        git 'git@github.com:DocumentIndexing/AlpineNodeAngularBuildImage.git'
    }
   stage ("build") {
      withMaven(options: [artifactsPublisher(disabled: true)]) {
          if (params.release) {
            try {
              sh 'mvn -B release:clean release:prepare -Dargs="-X"'
              sh 'mvn release:perform'
            } catch(e) {
               emailext attachLog: true, body: 'Release Failed', recipientProviders: [culprits()], replyTo: 'jenkins@g4pas.co.uk', subject: 'Release Failed'
                throw e
            }
          }
          else {
              try {
                  sh 'mvn clean deploy'
              } catch(e) {
                 emailext attachLog: true, body: 'Please fix the build', recipientProviders: [culprits()], replyTo: 'jenkins@g4pas.co.uk', subject: 'It appears you have broken the Build'
                  throw e
              }
          }
      }
   }
}
