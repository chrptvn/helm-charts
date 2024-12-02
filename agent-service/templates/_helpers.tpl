{{- define "agent-service.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "agent-service.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "agent-service.labels" -}}
helm.sh/chart: {{ include "agent-service.chart" . }}
app.kubernetes.io/name: {{ include "agent-service.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "agent-service.selectorLabels" -}}
app.kubernetes.io/name: {{ include "agent-service.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "agent-service.chart" -}}
{{ .Chart.Name }}-{{ .Chart.Version }}
{{- end }}
