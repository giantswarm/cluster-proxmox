{{/*
Append the API path to the Proxmox API URL as the cloud controller manager requires the full URL.
*/}}
{{ define "cloudControllerManagerURL" }}
{{- printf "%s%s" .Values.global.providerSpecific.proxmox.url "/api2/json" -}}
{{- end -}}
