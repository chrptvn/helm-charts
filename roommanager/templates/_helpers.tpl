{{- define "roommanager.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "roommanager.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "roommanager.labels" -}}
helm.sh/chart: {{ include "roommanager.chart" . }}
app.kubernetes.io/name: {{ include "roommanager.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "roommanager.selectorLabels" -}}
app.kubernetes.io/name: {{ include "roommanager.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "roommanager.chart" -}}
{{ .Chart.Name }}-{{ .Chart.Version }}
{{- end }}
