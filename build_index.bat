helm package ./assistant --destination ./
helm package ./invokeai --destination ./
helm package ./agentmanager --destination ./
helm repo index . --url https://chrptvn.github.io/helm-charts/
