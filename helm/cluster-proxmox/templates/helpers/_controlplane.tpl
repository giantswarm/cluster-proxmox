{{/*
Generates template spec for control plane machines.
*/}}
{{- define "controlplane-proxmoxmachinetemplate-spec" -}}
{{- $d := $.Values | deepCopy -}}
{{/* There isn't much to do here, just render the values out */}}
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
{{ $d.global.controlPlane.machineTemplate | toYaml }}
{{- end -}}
