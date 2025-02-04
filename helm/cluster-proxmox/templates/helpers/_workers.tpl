{{/*
Generates template spec for control plane machines.
*/}}
{{- define "worker-proxmoxmachinetemplate-spec" -}}
{{- $pool := $.nodePool.config | deepCopy -}}
{{- $pool = unset $pool "replicas" -}}
{{- $pool = unset $pool "machineHealthCheck" -}}

checks:
  skipQemuGuestAgent: false
  # we skip checking the cloud-init status as we're using ignition.
  skipCloudInitStatus: true
{{ $pool | toYaml }}
{{- end -}}