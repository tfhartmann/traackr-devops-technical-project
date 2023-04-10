# traackr-devops-technical-project

While this will work, it's worth calling out that `.local` is a reserver top level domain and makes [ingress DNS](https://minikube.sigs.k8s.io/docs/handbook/addons/ingress-dns/) with Minikube a bit dodgy, they recomend using a different domain. 


By Default the helm chart uses an image from tfhartmann/hello-world:1 

#### On A Mac 


* Install [homebrew](https://brew.sh/)  

```Shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

* Ensure (Docker)[https://docs.docker.com/engine/install/] is installed for your laptop. 
    * via Homebrew `brew install docker --cask`  
    * Ensure Docker Desktop is installed and started, if this is your first time, there will be some setup.  
      * `brew install docker --cask` 
    * Ensure Helm is installed: 
      * `brew install helm`
    * Install and Start Minikube:
      * `brew install minikube`
      *  `minikube start`
    * Enable Minikube extensions
      * `minikube addons enable ingress`
      * `minikube addons enable ingress-dns`
    * Install traefik 
      * `helm install traefik traefik/traefik`
    * Install Hello World
      * `helm install hello-world-chart hello-world-app`  
    * Update /etc/hosts with `echo '127.0.0.1       hello-world.local' | sudo tee -a /etc/hosts`
    * Enable minikube tunneling 
      * `minikube tunnel`
    * Open the http://hello-world.local/ link and browse to our app
