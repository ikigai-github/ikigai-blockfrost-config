{{- define "blockfrost.labels" -}}
app.kubernetes.io/name: {{ include "common.names.name" . }}
helm.sh/chart: {{ include "common.names.chart" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- range $k, $v := .Values.global.commonLabels }}
{{ $k }}: "{{ $v }}"
{{ end }}
{{- end }}


{{- define "blockfrost.annotations" -}}
{{- range $k, $v := .Values.global.commonAnnotations -}}
{{ $k }}: "{{ $v }}"
{{ end }}
{{- end }}
