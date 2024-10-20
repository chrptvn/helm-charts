{{- define "agentmanager.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "agentmanager.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "agentmanager.labels" -}}
helm.sh/chart: {{ include "agentmanager.chart" . }}
app.kubernetes.io/name: {{ include "agentmanager.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "agentmanager.selectorLabels" -}}
app.kubernetes.io/name: {{ include "agentmanager.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "agentmanager.chart" -}}
{{ .Chart.Name }}-{{ .Chart.Version }}
{{- end }}
