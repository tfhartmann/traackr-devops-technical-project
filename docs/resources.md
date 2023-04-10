For This exercice I used 

* Docker `brew install docker --cask`
* Homebrew ( probably )
* Visual Studio Code - for file edits, and syntax checking. 
* iTerm2 for commands that needed to be run in a terminal, as well as the Term in my IDE. This is purley because I like to have lots of windows opens. 
* I searched for a simple web server image on docker hub, and choose this one, https://hub.docker.com/_/httpd apache is fairly standard. This could just have easily been nginx or some other web server. 
* Created A Dockerfile in my IDE, this could have been done with `touch Dockerfile` in the root of the repo
* Created the `public-html` in my IDE, this could have been done with `mkdir public-html`
    * Created an `index.html` file in my IDE, this could have been done with `touch public-html/index.hmtl`
* Populated `index.html` with the string `Hello World`
* Build a local Docker image `docker build -t hello-world .` 
* Start the Image `docker run -dit --name hello-world-app -p 8080:80 hello-world`
    * Test to see if you can connect with `curl localhost:8080` you should also be able to browse to http://localhost:8080/
* Once done, stop your test container and remove it with `docker stop hello-world-app ;docker rm hello-world-app`

Now we'll set up a k8s cluster for local development. 
* We can use [Minikube brew](https://minikube.sigs.k8s.io/docs/) to install minikube run `brew install minikube`
* Start your cluster with `minikube start`
* Running ` minikube dashboard` opens a cluster status page that may be useful 


Helm 
* Install Helm `brew install helm`
  * Useful links 
    * https://helm.sh/docs/helm/helm_create/
* `helm create hello-world-app`
* Edit `hello-world-app/values.yaml`
* helm install hello-world-chart hello-world-app/ --values hello-world-app/values.yaml
* Running `export POD_NAME=$(kubectl get pods -l "app.kubernetes.io/name=hello-world-app,app.kubernetes.io/instance=hello-world-chart" -o jsonpath="{.items[0].metadata.name}")` returns the podname 
* `kubectl port-forward $POD_NAME 8080:80` forwards the port to 8080 on localhost! Yay, I get hello world. 

##### Traefik ( new to me! )
* `minikube addons enable ingress`
* `minikube addons enable ingress-dns`
* `https://github.com/traefik/traefik-helm-chart`
*  `helm repo add traefik https://traefik.github.io/charts`
* `helm install traefik traefik/traefik`



`helm upgrade --dry-run hello-world-chart hello-world-app/ --values hello-world-app/values.yaml `

