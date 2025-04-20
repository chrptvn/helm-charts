@echo off

:: Combine base version, timestamp, and SNAPSHOT
set version=1.0.0
helm package ./gymbro-be --destination ./ --version %version%
helm package ./gymbro-ui --destination ./ --version %version%
helm package ./socialapi --destination ./ --version %version%
helm package ./image-servlet --destination ./ --version %version%
helm repo index . --url https://chrptvn.github.io/helm-charts/

git add -A
git commit -m "Update Helm Chart"
git push
