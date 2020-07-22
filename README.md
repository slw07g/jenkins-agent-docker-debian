# jenkins-agent-docker-debian
Quickly set up a debian jenkins node with docker

1. Clone this repository
2. In a terminal, `cd` into the directory containing `Dockerfile` and `docker-compose.yml`. 
3. Build the docker image by running the command: `docker build -t jenkins-agent .`
4. Set the environment variables `JENKINS_URL`, `JENKINS_TUNNEL`, `JENKINS_SECRET`, and `JENKINS_NODE_NAME`. Example:
```
    export JENKINS_URL=https://jenkins_domain
    export JENKINS_TUNNEL=jenkins_domain:50000
    export JENKINS_SECRET=abcdefghijklmnopqrstuvwxyz # The secret provided by Jenkins
    export JENKINS_NODE_NAME=jenkins-agent-01 # The node name as set in Jenkins
```

If you're comfortable doing so, you could technically modify the Dockerfile to do this (appending it the export commands to `/home/jenkins/.bashrc`)

5. Start the agent using `docker-compose up` if successful, output should look like the following and you should see the node checked in in the Jenkins UI.
Then push ctrl+c and run `docker-compose up -d` so that it runs as a daemon.
```
docker_user@hostname:$ docker-compose up
Creating network "jenkins-agent_default" with the default driver
Creating jenkins-agent-cnt ... done
Attaching to jenkins-agent-cnt
jenkins-agent-cnt | Jul 22, 2020 6:12:12 AM hudson.remoting.jnlp.Main createEngine
jenkins-agent-cnt | INFO: Setting up slave: jenkins-node-name
jenkins-agent-cnt | Jul 22, 2020 6:12:12 AM hudson.remoting.jnlp.Main$CuiListener <init>
jenkins-agent-cnt | INFO: Jenkins agent is running in headless mode.
jenkins-agent-cnt | Jul 22, 2020 6:12:12 AM hudson.remoting.Engine startEngine
jenkins-agent-cnt | WARNING: No Working Directory. Using the legacy JAR Cache location: /root/.jenkins/cache/jars
jenkins-agent-cnt | Jul 22, 2020 6:12:13 AM hudson.remoting.jnlp.Main$CuiListener status
jenkins-agent-cnt | INFO: Locating server among [https://jenkins_domain]
jenkins-agent-cnt | Jul 22, 2020 6:12:13 AM org.jenkinsci.remoting.engine.JnlpAgentEndpointResolver resolve
jenkins-agent-cnt | INFO: Remoting server accepts the following protocols: [JNLP4-connect, Ping]
jenkins-agent-cnt | Jul 22, 2020 6:12:13 AM hudson.remoting.jnlp.Main$CuiListener status
jenkins-agent-cnt | INFO: Agent discovery successful
jenkins-agent-cnt |   Agent address: jenkins_domain
jenkins-agent-cnt |   Agent port:    50000
jenkins-agent-cnt |   Identity:      96:b5:68:a9:46:d5:93:37:26:29:71:cd:d0:d1:8f:c2
jenkins-agent-cnt | Jul 22, 2020 6:12:13 AM hudson.remoting.jnlp.Main$CuiListener status
jenkins-agent-cnt | INFO: Handshaking
jenkins-agent-cnt | Jul 22, 2020 6:12:13 AM hudson.remoting.jnlp.Main$CuiListener status
jenkins-agent-cnt | INFO: Connecting to jenkins_domain:50000
jenkins-agent-cnt | Jul 22, 2020 6:12:13 AM hudson.remoting.jnlp.Main$CuiListener status
jenkins-agent-cnt | INFO: Trying protocol: JNLP4-connect
jenkins-agent-cnt | Jul 22, 2020 6:12:13 AM hudson.remoting.jnlp.Main$CuiListener status
jenkins-agent-cnt | INFO: Remote identity confirmed: 96:b5:68:a9:46:d5:93:37:26:29:71:cd:d0:d1:8f:c2
jenkins-agent-cnt | Jul 22, 2020 6:12:14 AM hudson.remoting.jnlp.Main$CuiListener status
jenkins-agent-cnt | INFO: Connected

```
