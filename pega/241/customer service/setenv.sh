export CATALINA_OPTS="$CATALINA_OPTS -Xms512m"
export CATALINA_OPTS="$CATALINA_OPTS -Xmx5096m"
#export CATALINA_OPTS="$CATALINA_OPTS -XX:MaxPermSize=256m"
# export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_291.jdk/Contents/Home"
# mac
# export JAVA_HOME="/Library/Java/JavaVirtualMachines/applejdk-11.0.9.11.3.jdk/Contents/Home"
# RHEL8

# Oracle JDK 8
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk-11.jdk/Contents/Home"

# Open JDK
#export JAVA_HOME="/usr/lib/jvm/java-11-openjdk-11.0.16.0.8-1.el8_6.x86_64"
#export JAVA_HOME="/Library/Java/JavaVirtualMachines/openjdk-11.jdk/Contents/Home"
#export JAVA_HOME="/Library/Java/JavaVirtualMachines/openjdk-17.jdk/Contents/Home"
# Set JVM flags
#export JAVA_OPTS="$JAVA_OPTS -DNodeType=Search,WebUser,BackgroundProcessing,Stream -Djavax.net.debug=ssl"
export JAVA_OPTS="$JAVA_OPTS -DNodeType=Search,WebUser,BackgroundProcessing,Stream"