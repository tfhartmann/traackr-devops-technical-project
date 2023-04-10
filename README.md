# traackr-devops-technical-project

While this will work, it's worth calling out that `.local` is a reserver top level domain and makes [ingress DNS](https://minikube.sigs.k8s.io/docs/handbook/addons/ingress-dns/) with Minikube a bit dodgy, they recomend using a different domain. 

#### On A Mac 


* Install [homebrew](https://brew.sh/)  

```Shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

* Ensure (Docker)[https://docs.docker.com/engine/install/] is installed for your laptop. 
    * via Homebrew `brew install docker --cask`  
    * Ensure Docker Desktop is started, if this is your first time, there will be some setup.  
    * Start Minikube
    * Update /etc/hosts
