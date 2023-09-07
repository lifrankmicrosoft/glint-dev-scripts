alias startrabbitmq='sudo systemctl stop rabbitmq-server; sudo systemctl start rabbitmq-server; sudo systemctl status rabbitmq-server'
alias startmysql='sudo systemctl stop mysql; sudo systemctl start mysql; sudo systemctl status mysql'
alias startredis='sudo systemctl stop redis-server; sudo systemctl start redis-server; sudo systemctl status redis-server'
alias startelasticsearch='sudo systemctl stop elasticsearch; sudo systemctl start elasticsearch; sudo systemctl status elasticsearch'

alias be="cd $bepath"
export glintEngineeringPath="$bepath/GlintEngineering"
export glintClassPath="$bepath/target"

# Api Server
export apiServerPath="$bepath/awareai-api-server"
alias apiserver="cd $apiServerPath"
function apiserverdoit() {
  startallservices;
  takedownsputnik;
  apiserver;

  /usr/lib/jvm/java-8-openjdk-amd64/bin/java \
    -Dpom.version=1.0 \
    -XX:+HeapDumpOnOutOfMemoryError \
    -javaagent:/home/$USER/.m2/repository/org/eclipse/persistence/eclipselink/2.7.3/eclipselink-2.7.3.jar \
    -DcredentialsDir=/GlintEngineering/resources \
    -Drealm=local \
    -Dconsole.log=true \
    -Daws.s3FileUploadsUrl=mysql \
    -Dfile.encoding=UTF-8 \
    -classpath /tmp/frankglint.jar \
    com.awareai.rest.SputnikServer
}



function bebuildinner() {
    local start end duration_minutes duration_seconds total_seconds

    start=$(date +%s)  # Get the start time in seconds since the Unix epoch.

    be
    mvn clean
    mvn install -DskipTests -Dspotbugs.skip=true -e -X

    end=$(date +%s)  # Get the end time in seconds since the Unix epoch.
    total_seconds=$((end - start))
    
    duration_minutes=$((total_seconds / 60))
    duration_seconds=$((total_seconds % 60))

    echo "Execution time for bebuild : $duration_minutes minutes $duration_seconds seconds"
}

function bebuild(){
  measuretime bebuildinner
}
alias m2="sudo nano ~/.m2/settings.xml"

# Takedown =====================================================
# These are useful for taking processes taking up particular ports. This can be an issue with phantom proceses
function takedownfunc {
  pid=$(sudo lsof -t -i:$1)
  if [ -n "$pid" ]; then
    sudo kill -9 $pid
  else
    echo "No process is listening on port $1"
  fi
}
alias takedownsputnik="takedownfunc 18081"
alias takedownworkflow="takedownfunc 8888"
alias betakedown="takedownsputnik; takedownworkflow"

alias takedownall="betakedown; uitakedown"

