alias startrabbitmq='sudo systemctl stop rabbitmq-server; sudo systemctl start rabbitmq-server; sudo systemctl status rabbitmq-server'
alias startmysql='sudo systemctl stop mysql; sudo systemctl start mysql; sudo systemctl status mysql'
alias startredis='sudo systemctl stop redis-server; sudo systemctl start redis-server; sudo systemctl status redis-server'
alias startelasticsearch='sudo systemctl stop elasticsearch; sudo systemctl start elasticsearch; sudo systemctl status elasticsearch'

alias be="cd $bepath"
alias bebuild="be; mvn clean; mvn install -DskipTests -Dspotbugs.skip=true -e -X"
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
function takedownuimt(){
    takedownfunc 8000;
    takedownfunc 18081;
}
alias takedownall="betakedown; uitakedown"