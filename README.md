# Upgrade extensions

In order to update or upgrade your installation while offline, follow these steps:

- Turn off the server in the ExtensionsManager

```bash
kubectl -n infotopics scale deployment infotopics-extension-manager --replicas=0
```
- Turn on helper pod with PV mounted

```bash
kubectl -n infotopics scale deployment upgrader-extension-manager --replicas=1
```

- Go to …/AFT Extension Manager/extensions and delete the relevant product folder

```bash
POD_NAME=$(kubectl get pods -n infotopics --no-headers -o custom-columns=":metadata.name" | grep upgrader-extension-manager)

kubectl -n infotopics exec -it $POD_NAME --replicas=1 --bash

cd app/AFT Extension Manager/extensions 
rm -rf << Extension directory >>
exit
```

- Scale down updater pod and scale up extension manager.

```bash
kubectl -n infotopics scale deployment upgrader-extension-manager --replicas=0

kubectl -n infotopics scale deployment infotopics-extension-manager --replicas=1
```

- Download the updated version of the product from the AFT Company Portal: https://my-appsfortableau.infotopics.com/

- Go to “Manual product installation” and drag in the .zip file

- Restart the product