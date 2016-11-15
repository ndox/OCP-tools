#!/bin/bash


#ERVICES_URL=${oc get route --all-namespaces | awk '{print $1}'}
#ERVICES_PORT=${oc get route --all-namespaces | awk '{print $5}'}

SERVICES_URL=${oc export route --all-namespaces --template="{{range .items}}{{.spec.host}}{{end}}"}

while true  
    do echo `date`

    echo "all pods :"
    oc get pods --all-namespaces
    
    echo "Number of running pods :"
    oc get pods --all-namespaces | grep -ie running | wc -l
    
    echo "checking services"
    for i in ${SERVICES[@]}
        do echo $i
        curl -kv $i
    done
    
    sleep 10;
    
Done
