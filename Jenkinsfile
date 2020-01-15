pipeline {
    agent { label "${env.SLAVES}" }
    options {
        timeout(time: 2, unit: 'HOURS')
        timestamps()
    }
    stages {
        stage("BuildAndTest") {
            matrix {
                agent { label "${env.SLAVES}" }
                environment {
                    MACHINE = sh(script: 'uname -m', returnStdout: true).trim()
                }
                axes {
                    axis {
                        name "DATABASE"
                        values "mongo", "redis"
                    }
                }
                stages {
                    stage("SetupEnv_amd") {
                        when {
                            expression { "${MACHINE}" == "x86_64" }
                        }
                        steps {
                            sh "sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-\$(uname -s)-\$(uname -m) -o /usr/local/bin/docker-compose"
                            sh "sudo chmod +x /usr/local/bin/docker-compose"
                            script {
                                env.postman = "postman/newman:4.5.6"
                                env.appService = "nexus3.edgexfoundry.org:10004/docker-app-service-configurable:master"
                            }
                        }
                    }
                    stage("SetupEnv_arm") {
                        when {
                            not { expression { "${MACHINE}" == "x86_64"  } }
                        }
                        steps {
                            sh "sudo apt install -y --no-install-recommends docker-compose"
                            script {
                                env.postman = "nexus3.edgexfoundry.org:10003/edgex-newman:4.5.6-arm64"
                                env.appService = "nexus3.edgexfoundry.org:10004/docker-app-service-configurable-arm64:master"
                            }
                        }
                    }
                    stage("Build") {
                        steps {
                            sh "bash deploy-edgeX.sh"
                        }
                    }
                    stage("Test") {
                        steps {
                            dir(path: "bin") {
                                sh "bash run.sh -all"
                                sh "sed -E -i \'s/testsuite name=\"/testsuite name=\"${DATABASE}_/\' \$(ls testResult/*.xml)"
                                stash name: "report-${DATABASE}", includes: "testResult/*"
                            }
                        }
                    }
                }
            }
        }
    }
    post {
        success {
            unstash "report-mongo"
            unstash "report-redis"
            script {
                allure ([
                    includeProperties: false,
                    jdk: '',
                    reportBuildPolicy: 'ALWAYS',
                    results: [[path: 'testResult']]
                ])
            }
        }
    }
}
