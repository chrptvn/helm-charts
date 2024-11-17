{{- define "agent-hq.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "agent-hq.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "agent-hq.labels" -}}
helm.sh/chart: {{ include "agent-hq.chart" . }}
app.kubernetes.io/name: {{ include "agent-hq.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "agent-hq.selectorLabels" -}}
app.kubernetes.io/name: {{ include "agent-hq.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "agent-hq.chart" -}}
{{ .Chart.Name }}-{{ .Chart.Version }}
{{- end }}
