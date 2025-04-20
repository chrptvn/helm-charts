{{- define "socialapi.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "socialapi.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "socialapi.labels" -}}
helm.sh/chart: {{ include "socialapi.chart" . }}
app.kubernetes.io/name: {{ include "socialapi.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "socialapi.selectorLabels" -}}
app.kubernetes.io/name: {{ include "socialapi.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "socialapi.chart" -}}
{{ .Chart.Name }}-{{ .Chart.Version }}
{{- end }}
