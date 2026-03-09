{{/*
Generates template spec for control plane machines.
*/}}
{{- define "worker-proxmoxmachinetemplate-spec" -}}
{{- $pool := $.nodePool.config | deepCopy -}}
{{- $pool = unset $pool "replicas" -}}
{{- $pool = unset $pool "machineHealthCheck" -}}

templateSelector:
  matchTags:
    - 'release-channel_{{ include "cluster.os.releaseChannel" $ }}'
    - 'flatcar_{{ include "cluster.os.version" $ }}'
    - 'kubernetes_{{ include "cluster.component.kubernetes.version" $ }}'
    - 'os-tooling_{{ include "cluster.os.tooling.version" $ }}'
checks:
  skipQemuGuestAgent: false
  # we skip checking the cloud-init status as we're using ignition.
  skipCloudInitStatus: true
{{ $pool | toYaml }}
{{- end -}}
