{{- define "cardano-db-sync.postgres_pass" -}}
  {{- $existingSecret := (lookup "v1" "Secret" .Release.Namespace "db-user-pass") }}
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

