# `argocd_outdated_apps`

Still WIP, but basic functionality exists

## Usage

```sh

dart pub global activate --source git https://github.com/Wikiwix/argocd_outdated_apps.git # install
kubectl --namespace=argocd get applications -oyaml | dart run argocd_outdated_apps # dart run is only necessary if the pub-cache is not in the path
```
