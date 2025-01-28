{{- define "gymbro-ui.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "gymbro-ui.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "gymbro-ui.labels" -}}
helm.sh/chart: {{ include "gymbro-ui.chart" . }}
app.kubernetes.io/name: {{ include "gymbro-ui.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "gymbro-ui.selectorLabels" -}}
app.kubernetes.io/name: {{ include "gymbro-ui.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "gymbro-ui.chart" -}}
{{ .Chart.Name }}-{{ .Chart.Version }}
{{- end }}
