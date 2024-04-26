#!/bin/bash

# Define your Kubernetes pod and port information
NAMESPACE="your_namespace"
POD_NAME="your_pod_name"
LOCAL_PORT="local_port"
REMOTE_PORT="remote_port"

# Function to check if port-forwarding is running
check_port_forwarding() {
    if ! pgrep -f "kubectl port-forward -n $NAMESPACE $POD_NAME $LOCAL_PORT:$REMOTE_PORT" >/dev/null; then
        echo "Port-forwarding is not running" > /home/ec2-user/port-forwarding.logs
        start_port_forwarding
    else
        echo "Port-forwarding is already running" > /home/ec2-user/port-forwarding.logs
    fi
}

# Function to start port-forwarding
start_port_forwarding() {
    echo "Starting port-forwarding..." > /home/ec2-user/port-forwarding.logs
    kubectl port-forward -n $NAMESPACE $POD_NAME $LOCAL_PORT:$REMOTE_PORT >/dev/null 2>&1 &
}

# Main function
main() {
    while true; do
        check_port_forwarding
        sleep 60 # Check every 60 seconds
    done
}

main
