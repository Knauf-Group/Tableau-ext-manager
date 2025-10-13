# Upgrade extensions

In order to update or upgrade your installation while offline, follow these steps:

- Download new extension binary

- Scale up helper pod with PV mounted

```bash
kubectl -n infotopics scale deployment upgrader-extension-manager --replicas=1
```

- Scale down the server in the ExtensionsManager

```bash
kubectl -n infotopics scale deployment infotopics-extension-manager --replicas=0
```

- Go to …/AFT Extension Manager/extensions and delete the relevant directory

```bash
POD_NAME=$(kubectl get pods -n infotopics --no-headers -o custom-columns=":metadata.name" | grep upgrader-extension-manager)

kubectl -n infotopics exec -it $POD_NAME --bash

cd app/AFT Extension Manager/extensions/
rm  << Extension directory >>
exit
```

- Scale down updater pod and scale up extension manager.

```bash
kubectl -n infotopics scale deployment infotopics-extension-manager --replicas=1
kubectl -n infotopics scale deployment upgrader-extension-manager --replicas=0

```

- Go to “Manual product installation” and drag in the .zip file and license

- Restart the product