pipeline 
{
    agent any

    stages
    {
        stage("Merging")
        {
            steps
            {
                sh 'chmod 755 merge.sh'
                sh './merge.sh merging_stage'
            }
        }
        stage("Building")
        {
            steps
            {
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
}