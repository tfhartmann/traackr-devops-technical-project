Commands I ran while working, this isn't a conmplete list of every command, but should be fairly reprsentive. For example, I skipped lots of "brew install" commands, they get called out in the README and the script - some other commands can be found in resources.md 
* `git add Dockerfile` 
* `git add docs/`
* `git add public-html/`
* `docker build -t tfhartmann/hello-world .`
* `docker tag tfhartmann/hello-world tfhartmann/hello-world:1`
* `docker push -a tfhartmann/hello-world`
* `minikube start` ; `minikube dashboard` ; `minikube tunnel` ; `minikube ip` ; `minikube service hello-world-chart-hello-world-app --url` ; `minikube addons enable ingress`
* `helm create hello-world-chart hello-world-app/` ; `helm upgrade hello-world-chart hello-world-app/ --values hello-world-app/values.yaml ` ; `helm test traefik` ; `helm install traefik traefik/traefik`
* `helm upgrade --dry-run hello-world-chart hello-world-app/ --values hello-world-app/values.yaml `




