{{- define "image-servlet.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "image-servlet.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "image-servlet.labels" -}}
helm.sh/chart: {{ include "image-servlet.chart" . }}
app.kubernetes.io/name: {{ include "image-servlet.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "image-servlet.selectorLabels" -}}
app.kubernetes.io/name: {{ include "image-servlet.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "image-servlet.chart" -}}
{{ .Chart.Name }}-{{ .Chart.Version }}
{{- end }}
