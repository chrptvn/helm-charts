{{- define "message-manager.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "message-manager.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "message-manager.labels" -}}
helm.sh/chart: {{ include "message-manager.chart" . }}
app.kubernetes.io/name: {{ include "message-manager.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "message-manager.selectorLabels" -}}
app.kubernetes.io/name: {{ include "message-manager.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "message-manager.chart" -}}
{{ .Chart.Name }}-{{ .Chart.Version }}
{{- end }}
