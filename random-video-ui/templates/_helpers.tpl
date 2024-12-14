{{- define "random-video-ui.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "random-video-ui.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "random-video-ui.labels" -}}
helm.sh/chart: {{ include "random-video-ui.chart" . }}
app.kubernetes.io/name: {{ include "random-video-ui.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "random-video-ui.selectorLabels" -}}
app.kubernetes.io/name: {{ include "random-video-ui.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "random-video-ui.chart" -}}
{{ .Chart.Name }}-{{ .Chart.Version }}
{{- end }}
