# Kubernetes Notes

## **Windows 10 and Minikube**

1. Open a powershell admin command
2. Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
3. . $profile
4. choco install kubernetes-cli
5. choco install minikube
6. Add C:\Program Files (x86)\Kubernetes\Minikube to the path if it isn't already there
7. run refreshenv to refresh the path
8. run $env:path -split ";" to get a list of path entries
9. run kubectl version
10. run minikube version
11. Load Hyper-V Manager from the start menu
12. Go to the Virtual Switch Manage and add a new External Switch connected to your working network adapter, e.g. wifi or ethernet.  In this example i have called it Kubernetes - WiFi
13. When you create an external network switch attached to you current adapter the network will change to route things through this virtual switch.  The problem here though is that the virtual switch will probably come back as a Public network rather than private.  This causes issues with the firewall rules etc.  To change it to Private:

    - Open a powershell admin prompt
    - Run Get-NetConnectionProfile
    - Locate the profile for "Kubernetes - WiFi" and make a note of the InterfaceIndex
    - Run Set-NetConnectionProfile -InterfaceIndex X -NetworkCategory Private
    - Replace X with the InterfaceIndex in the above command
    - Run Get-NetConnectionProfile to check that it has changed

14. Go back to the powershell prompt
15. This will download a number of things and create/setup a vm in Hyper-V.  Run minikube start --vm-driver=hyperv --hyperv-virtual-switch="Kubernetes - WiFi" --memory 2048

    - The amount of memory could/should be larger, e.g. 4096.
    - The login details are: Username - docker Password - tcuser
    - The console can get stuck at "Starting Cluser Components".  It will take a while to connect so be patient.  If this does happen then this is usually down to the service not being able to communicate with the virtual machine.  This is usally down to the firewall configuration.

16. Run minikube status.  This will tell you if it is running correctly.

    - minikube: Running
    - cluster: Running
    - kubectl: Correctly Configured: pointing to minikube-vm at 192.168.11.29

17. Run minikube dashboard

    - This will take a while.  You may see a number of messages saying "Waiting, endpoint for service is not ready yet..."
    - If you just want the IP address and port run  minikube dashboard --url=true

18. If you want you can log in to the VM. You will see the minikube logo appear and a bash prompt.

    - To exit, type logout

19. Set current kubectl config to point to/work with local minikube cluster: kubectl config set-context minikube

    - If you want to connect to a remote minikube cluster you can type:
        - kubectl config set-context test-cluster --server=http://<master-ip>:<port>
        - kubectl config use-context test-cluster

1. Get minikube cluster config details: kubectl config view minikube
1. to get the master node endpoint details with IP & port used: kubectl cluster-info
1. Get all currently running pods across all namespaces: kubectl get pods --all-namespaces
