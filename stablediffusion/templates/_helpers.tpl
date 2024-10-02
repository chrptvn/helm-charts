{{- define "stablediffusion.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "stablediffusion.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "stablediffusion.labels" -}}
helm.sh/chart: {{ include "stablediffusion.chart" . }}
app.kubernetes.io/name: {{ include "stablediffusion.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "stablediffusion.selectorLabels" -}}
app.kubernetes.io/name: {{ include "stablediffusion.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "stablediffusion.chart" -}}
{{ .Chart.Name }}-{{ .Chart.Version }}
{{- end }}
