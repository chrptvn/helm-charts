{{- define "gymbro-be.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "gymbro-be.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "gymbro-be.labels" -}}
helm.sh/chart: {{ include "gymbro-be.chart" . }}
app.kubernetes.io/name: {{ include "gymbro-be.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "gymbro-be.selectorLabels" -}}
app.kubernetes.io/name: {{ include "gymbro-be.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "gymbro-be.chart" -}}
{{ .Chart.Name }}-{{ .Chart.Version }}
{{- end }}
