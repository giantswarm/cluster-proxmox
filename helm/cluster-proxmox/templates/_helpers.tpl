{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "name" -}}
{{- .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a prefix for all resource names.
*/}}
{{- define "resource.default.name" -}}
{{ .Release.Name }}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "infrastructureApiVersion" -}}
infrastructure.cluster.x-k8s.io/v1alpha2
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "labels.selector" -}}
app: {{ include "name" . | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service | quote }}
application.giantswarm.io/team: {{ index .Chart.Annotations "application.giantswarm.io/team" | quote }}
cluster.x-k8s.io/cluster-name: {{ include "resource.default.name" . | quote }}
giantswarm.io/cluster: {{ include "resource.default.name" . | quote }}
giantswarm.io/organization: {{ required "You must provide an existing organization name in .global.metadata.organization" .Values.global.metadata.organization | quote }}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "labels.common" -}}
{{- include "labels.selector" . }}
app.kubernetes.io/version: {{ $.Chart.Version | quote }}
helm.sh/chart: {{ include "chart" . | quote }}
release.giantswarm.io/version: {{ .Values.global.release.version | trimPrefix "v" | quote }}
{{- end -}}

{{/*
Create label to prevent accidental cluster deletion
*/}}
{{- define "preventDeletionLabel" -}}
{{- if $.Values.global.metadata.preventDeletion -}}
giantswarm.io/prevent-deletion: "true"
{{- end -}}
{{- end -}}

{{- define "credentialSecretName" -}}
{{- include "resource.default.name" $ }}-proxmox-credentials
{{- end -}}

{{/*
Takes an array of maps containing worker nodePools and adds each map to a new
map. Results in a map of node specs which can be iterated over to create
MachineDeployments.
*/}}
{{ define "createMapOfWorkerPoolSpecs" -}}
{{- $nodeMap := dict -}}
{{- range $index, $pool := .Values.global.nodePools | default .Values.cluster.providerIntegration.workers.defaultNodePools -}}
  {{- $_ := set $nodeMap $index $pool -}}
{{- end -}}
{{ toYaml $nodeMap }}
{{- end }}

{{- define "cloudProviderProxmoxSecret" }}
features:
  provider: capmox
clusters:
- url: {{ .Values.global.providerSpecific.proxmox.url | quote }}
  insecure: {{ .Values.global.providerSpecific.proxmox.insecure  }}
  token_id: {{ .Values.global.providerSpecific.proxmox.token | quote }}
  token_secret: {{ .Values.global.providerSpecific.proxmox.secret | quote }}
  region: {{ .Values.global.providerSpecific.proxmox.clusterName | quote }}
{{ end -}}

{{- define "securityContext.runAsUser" -}}
1000
{{- end -}}
{{- define "securityContext.runAsGroup" -}}
1000
{{- end -}}
