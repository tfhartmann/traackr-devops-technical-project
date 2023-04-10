# traackr-devops-technical-project

While this will work, it's worth calling out that `.local` is a reserver top level domain and makes [ingress DNS](https://minikube.sigs.k8s.io/docs/handbook/addons/ingress-dns/) with Minikube a bit dodgy, they recomend using a different domain. 


By Default the helm chart image tfhartmann/hello-world:1 which is a public image in my personal docker repo. 

This project took me a couple of hours call it 3 or 4, both `helm` and `traefik` were new to me, so I spent a bit of time reading the docs. 

Additional docs can be found under `docs/` and should align with the expected output. `resources.md` is a bit stream of consiousness, all the docs could use some cleanup, but they should be functional. 

#### On A Mac 

##### Scripted 
running the start.sh script in the root of this repo will install and run this demo. It does require that you have Docker installed and running, but otherwise should install and configure everything else.  The script require input in the form of the sudo password, and does update `/etc/hosts` so please clean that up after you've run it :smile: 

##### Manual 
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
