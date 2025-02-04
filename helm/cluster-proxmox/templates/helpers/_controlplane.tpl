{{/*
Generates template spec for control plane machines.
*/}}
{{- define "controlplane-proxmoxmachinetemplate-spec" -}}
{{- $d := $.Values | deepCopy -}}

{{/* There isn't much to do here, just render the values out */}}
checks:
  skipQemuGuestAgent: false
  # we skip checking the cloud-init status as we're using ignition.
  skipCloudInitStatus: true
{{ $d.global.controlPlane.machineTemplate | toYaml }}
{{- end -}}
