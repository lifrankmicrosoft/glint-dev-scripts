#!/bin/bash

function startallservices(){
    sudo ntpdate ntp.ubuntu.com 
    sudo service ntp start
    sudo service mysql start
    sudo service redis-server start
    sudo service elasticsearch start
}

