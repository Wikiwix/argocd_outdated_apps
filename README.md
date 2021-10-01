# `argocd_outdated_apps`

Still WIP, but basic functionality exists

## Usage

```sh
dart pub global activate --source git https://github.com/Wikiwix/argocd_outdated_apps.git # install
kubectl --namespace=argocd get applications -oyaml | dart pub global run argocd_outdated_apps
```
