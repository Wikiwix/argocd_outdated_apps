# `argocd_outdated_apps`

This tool allows to determine outdated ArgoCD `Applications` which are installed from *public* Helm charts, by inspecting the `Application` objects within the cluster.

## Usage

```sh
# install the latest version from git
dart pub global activate --source="git" https://github.com/Wikiwix/argocd_outdated_apps.git
# `dart pub global run` is only necessary if the pub-cache is not in your Path
kubectl --namespace="argocd" get applications --output="yaml" | dart pub global run argocd_outdated_apps
```
