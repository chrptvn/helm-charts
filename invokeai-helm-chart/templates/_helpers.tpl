{{- define "invokeai.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "invokeai.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "invokeai.labels" -}}
helm.sh/chart: {{ include "invokeai.chart" . }}
app.kubernetes.io/name: {{ include "invokeai.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "invokeai.selectorLabels" -}}
app.kubernetes.io/name: {{ include "invokeai.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "invokeai.chart" -}}
{{ .Chart.Name }}-{{ .Chart.Version }}
{{- end }}
