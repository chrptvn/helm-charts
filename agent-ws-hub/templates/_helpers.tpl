{{- define "agent-ws-hub.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "agent-ws-hub.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "agent-ws-hub.labels" -}}
helm.sh/chart: {{ include "agent-ws-hub.chart" . }}
app.kubernetes.io/name: {{ include "agent-ws-hub.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "agent-ws-hub.selectorLabels" -}}
app.kubernetes.io/name: {{ include "agent-ws-hub.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "agent-ws-hub.chart" -}}
{{ .Chart.Name }}-{{ .Chart.Version }}
{{- end }}
