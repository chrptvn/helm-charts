{{- define "video-scraper.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "video-scraper.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "video-scraper.labels" -}}
helm.sh/chart: {{ include "video-scraper.chart" . }}
app.kubernetes.io/name: {{ include "video-scraper.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "video-scraper.selectorLabels" -}}
app.kubernetes.io/name: {{ include "video-scraper.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "video-scraper.chart" -}}
{{ .Chart.Name }}-{{ .Chart.Version }}
{{- end }}
