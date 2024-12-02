{{- define "room-service.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "room-service.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "room-service.labels" -}}
helm.sh/chart: {{ include "room-service.chart" . }}
app.kubernetes.io/name: {{ include "room-service.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "room-service.selectorLabels" -}}
app.kubernetes.io/name: {{ include "room-service.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "room-service.chart" -}}
{{ .Chart.Name }}-{{ .Chart.Version }}
{{- end }}
