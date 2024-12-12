{{- define "random-video-be.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "random-video-be.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "random-video-be.labels" -}}
helm.sh/chart: {{ include "random-video-be.chart" . }}
app.kubernetes.io/name: {{ include "random-video-be.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "random-video-be.selectorLabels" -}}
app.kubernetes.io/name: {{ include "random-video-be.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "random-video-be.chart" -}}
{{ .Chart.Name }}-{{ .Chart.Version }}
{{- end }}
