#!/bin/bash

root_folder=$(cd $(dirname $0); cd ..; pwd)

exec 3>&1

function _out() {
  echo "$(date +'%F %H:%M:%S') $@"
}

function setup() {
  
  pod=$(kubectl get pods | grep web-api-reactive | awk ' {print $1} ')
  _out $pod
  kubectl logs $pod web-api-reactive
  
}

setup