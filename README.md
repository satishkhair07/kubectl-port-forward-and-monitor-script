# kubectl-port-forward-and-monitor-script
Shell script that checks if a kubectl port-forward command is running and starts it if it's not

**Description**

Replace **"your_namespace"**, **"your_pod_name"**, **"local_port"**, and **"remote_port"** with the appropriate values for your setup.

**This script defines two functions:**

1. **check_port_forwarding()**: This function checks if the **kubectl port-forward** command is running by searching for its process using **pgrep**. If the command is not running, it calls the **start_port_forwarding()** function.

2. **start_port_forwarding()**: This function starts the **kubectl port-forward** command.

The **main()** function continuously calls **check_port_forwarding()** in a loop with a sleep interval of 60 seconds. You can adjust the sleep interval as needed based on your requirements.

Save this script to a file **(e.g., port_forwarding_checker.sh)**, make it executable **(chmod +x port_forwarding_checker.sh)**, and then you can run it on your system. Make sure you have **kubectl** configured with appropriate permissions to interact with your Kubernetes cluster
