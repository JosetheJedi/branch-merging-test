def scriptReturnStatus = ''

pipeline 
{
    agent any

    parameters{
        string(name: 'USERNAME', defaultValue: 'Jenkins', description: 'Who is running this task?')

        string(name: 'USEREMAIL', defaultValue: 'josefhu15@gmail.com', description: 'Enter your email. Default is SCRUM Masters.')
    }

    stages
    {
        stage("Merging")
        {
            steps
            {
                sh 'chmod 755 configureGit.sh'
                sh "./configureGit.sh ${params.USERNAME} ${params.USEREMAIL}"
                sh 'chmod 755 merge.sh'
                // sh './merge.sh merging_stage'
                script{
                    scriptReturnStatus = sh(returnStatus: true, script: './merge.sh merging_stage')
                }
                echo "$scriptReturnStatus"

            }
            when{ 
                scriptReturnStatus = "1"
            }
            steps{
                echo "hello world it failed"
            }
        }
        stage("Building")
        {
            steps
            {
                sh 'chmod 755 merge.sh'
                sh './merge.sh building_stage'
            }
        }
        stage("Testing")
        {
            steps
            {
                sh './merge.sh testing_stage'
            }
        }
        stage("Deploying")
        {
            steps
            {
                sh './merge.sh deployment_stage'
            }
        }
        stage("Clean")
        {
            steps  
            {
                sh "echo Cleaning up :3"
                deleteDir()
            }
        }
    }
    post
    {
        failure
        {
            sh 'echo We should send an email out when the build fails.'
            sh 'echo $?'
        }
    }
}