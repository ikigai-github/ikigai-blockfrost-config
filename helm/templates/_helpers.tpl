{{- define "blockfrost.labels" -}}
app.kubernetes.io/name: blockfrost
helm.sh/chart: {{ .Chart.Name }}
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

{{- define "blockfrost.postgres_pass" -}}
  {{- $existingSecret := (lookup "v1" "Secret" .Release.Namespace .Values.global.postgresql.auth.secretName) }}
  {{- if .Values.postgresql.auth.password -}}
    postgres_password: {{ .Values.postgresql.auth.password }}
  {{- else }}
    {{- if $existingSecret -}}
    postgres_password: {{ index $existingSecret.data "postgres_password" }}
    {{- else -}}
    postgres_password: {{ randAlphaNum 20 | b64enc | quote }}
    {{- end }}
  {{ end }}

  {{- if .Values.postgresql.deploy }}
    {{- if .Values.postgresql.auth.postgresPassword -}}
      postgres_admin_password: {{ .Values.postgresql.auth.postgresPassword }}
    {{- else }}
      {{- if $existingSecret -}}
      postgres_admin_password: {{ index $existingSecret.data "postgres_admin_password" }}
      {{- else -}}
      postgres_admin_password: {{ randAlphaNum 20 | b64enc | quote }}
      {{- end }}
    {{- end }}
  {{ end }}
{{ end }}

