@echo off
del *.tgz

:: Define the base version
set baseVersion=1.0.0

:: Get the current date in yyyyMMdd format
for /f "tokens=2 delims==" %%A in ('wmic os get localdatetime /value ^| find "="') do set datetime=%%A
set datePart=%datetime:~0,8%
set timePart=%datetime:~8,4%

:: Combine date and time for the timestamp
set timestamp=%datePart%%timePart%

:: Combine base version, timestamp, and SNAPSHOT
set version=%baseVersion%-%timestamp%-SNAPSHOT
helm package ./agent-service --destination ./ --version %version%
helm package ./room-service --destination ./ --version %version%
helm package ./random-video-be --destination ./ --version %version%
helm package ./random-video-ui --destination ./ --version %version%
helm package ./video-scraper --destination ./ --version %version%
helm repo index . --url https://chrptvn.github.io/helm-charts/

git add -A
git commit -m "Update Helm Chart"
git push
