{{- define "assistant.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "assistant.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "assistant.labels" -}}
helm.sh/chart: {{ include "assistant.chart" . }}
app.kubernetes.io/name: {{ include "assistant.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "assistant.selectorLabels" -}}
app.kubernetes.io/name: {{ include "assistant.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "assistant.chart" -}}
{{ .Chart.Name }}-{{ .Chart.Version }}
{{- end }}
