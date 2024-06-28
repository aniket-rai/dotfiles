# K8s
alias k="kubectl"

# JDK
alias jdk8="export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)"
alias jdk11="export JAVA_HOME=$(/usr/libexec/java_home -v 11)"
alias jdk15="export JAVA_HOME=$(/usr/libexec/java_home -v 15)"
alias jdk17="export JAVA_HOME=$(/usr/libexec/java_home -v 17)"
alias jdk21="export JAVA_HOME=$(/usr/libexec/java_home -v 21)"

# FOLDER MANAGMENT
alias /dev="cd /Volumes/git"
alias /git="cd /Volumes/git"
alias /endeavour="cd /Volumes/git/endeavour"
alias /hermes="cd /Volumes/git/hermes"
alias /cronus="cd /Volumes/git/chronus"
alias /piom="cd /Volumes/git/pds-issue-object-manager"

# GRADLE
alias compile="gw compileJava"
alias build="gw build"
alias setup="gw devEnvSetup"
alias start="gw devEnvStart"
alias stop="gw devEnvStop"
alias restart="stop && setup && start"
alias conjure="gw compileConjure compileIr"
alias locks="gw --write-locks"
