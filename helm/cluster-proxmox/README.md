# Values schema documentation

This page lists all available configuration options, based on the [configuration values schema](values.schema.json).

<!-- DOCS_START -->

### 
Properties within the `.internal` top-level object

| **Property** | **Description** | **More Details** |
| :----------- | :-------------- | :--------------- |
| `internal.kubectlImage` | **Kubectl image** - Used by cluster-shared library chart to configure coredns in-cluster.|**Type:** `object`<br/>|
| `internal.kubectlImage.name` | **Repository**|**Type:** `string`<br/>**Default:** `"giantswarm/kubectl"`|
| `internal.kubectlImage.registry` | **Registry**|**Type:** `string`<br/>**Default:** `"gsoci.azurecr.io"`|
| `internal.kubectlImage.tag` | **Tag**|**Type:** `string`<br/>**Default:** `"1.29.9"`|

### Connectivity
Properties within the `.global.connectivity` object
Configurations related to cluster connectivity such as container registries.

| **Property** | **Description** | **More Details** |
| :----------- | :-------------- | :--------------- |
| `global.connectivity.baseDomain` | **Base DNS domain**|**Type:** `string`<br/>|
| `global.connectivity.containerRegistries` | **Container registries** - Endpoints and credentials configuration for container registries.|**Type:** `object`<br/>**Default:** `{}`|
| `global.connectivity.containerRegistries.*` |**None**|**Type:** `array`<br/>|
| `global.connectivity.containerRegistries.*[*]` |**None**|**Type:** `object`<br/>|
| `global.connectivity.containerRegistries.*[*].credentials` | **Credentials** - Credentials for the endpoint.|**Type:** `object`<br/>|
| `global.connectivity.containerRegistries.*[*].credentials.auth` | **Auth** - Base64-encoded string from the concatenation of the username, a colon, and the password.|**Type:** `string`<br/>|
| `global.connectivity.containerRegistries.*[*].credentials.identitytoken` | **Identity token** - Used to authenticate the user and obtain an access token for the registry.|**Type:** `string`<br/>|
| `global.connectivity.containerRegistries.*[*].credentials.password` | **Password** - Used to authenticate for the registry with username/password.|**Type:** `string`<br/>|
| `global.connectivity.containerRegistries.*[*].credentials.username` | **Username** - Used to authenticate for the registry with username/password.|**Type:** `string`<br/>|
| `global.connectivity.containerRegistries.*[*].endpoint` | **Endpoint** - Endpoint for the container registry.|**Type:** `string`<br/>|
| `global.connectivity.localRegistryCache` | **Local registry cache** - Caching container registry within the cluster.|**Type:** `object`<br/>|
| `global.connectivity.localRegistryCache.enabled` | **Enable** - Enabling this will deploy the Zot registry service in the cluster. To make use of it as a pull-through cache, you also have to specify registries to cache images for.|**Type:** `boolean`<br/>**Default:** `false`|
| `global.connectivity.localRegistryCache.mirroredRegistries` | **Registries to cache** - Here you must specify each registry to cache container images for. Please also make sure to have an entry for each registry in Global > Components > Containerd > Container registries.|**Type:** `array`<br/>**Default:** `[]`|
| `global.connectivity.localRegistryCache.mirroredRegistries[*]` |**None**|**Type:** `string`<br/>|
| `global.connectivity.localRegistryCache.port` | **Service port** - NodePort used by the local registry service.|**Type:** `integer`<br/>**Default:** `32767`|
| `global.connectivity.network` | **Network**|**Type:** `object`<br/>|
| `global.connectivity.network.controlPlaneEndpoint` | **Endpoint** - Kubernetes API configuration.|**Type:** `object`<br/>|
| `global.connectivity.network.controlPlaneEndpoint.host` | **Host** - IP for access to the Kubernetes API. Manually select an IP for kube API. Empty string for auto selection from the ipPoolName pool.|**Type:** `string`<br/>|
| `global.connectivity.network.controlPlaneEndpoint.ipPoolName` | **Ip Pool Name** - Ip for control plane will be drawn from this GlobalInClusterIPPool resource.|**Type:** `string`<br/>**Value pattern:** `^[a-z0-9]([-a-z0-9]*[a-z0-9])?(\.[a-z0-9]([-a-z0-9]*[a-z0-9])?)*$`<br/>**Default:** `"wc-cp-ips"`|
| `global.connectivity.network.controlPlaneEndpoint.port` | **Port number** - Port for access to the Kubernetes API.|**Type:** `integer`<br/>**Default:** `6443`|
| `global.connectivity.network.loadBalancers` | **Load balancers** - Loadbalancer IP source.|**Type:** `object`<br/>|
| `global.connectivity.network.loadBalancers.cidrBlocks` |**None**|**Type:** `array`<br/>|
| `global.connectivity.network.loadBalancers.cidrBlocks[*]` |IPv4 address range, in CIDR notation.|**Type:** `string`<br/>**Example:** `"10.244.0.0/16"`<br/>**Value pattern:** `^((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)(/([0-9]|[1,2][0-9]|[3][0-2]))?$`<br/>|
| `global.connectivity.network.loadBalancers.ipPoolName` | **Ip Pool Name** - Ip for Service LB running in WC will be drawn from this GlobalInClusterIPPool resource.|**Type:** `string`<br/>**Value pattern:** `^[a-z0-9]([-a-z0-9]*[a-z0-9])?(\.[a-z0-9]([-a-z0-9]*[a-z0-9])?)*$`<br/>**Default:** `"svc-lb-ips"`|
| `global.connectivity.network.loadBalancers.numberOfIps` | **Number of LB IPs to reserve**|**Type:** `integer`<br/>**Default:** `3`|
| `global.connectivity.network.pods` | **Pods**|**Type:** `object`<br/>|
| `global.connectivity.network.pods.cidrBlocks` |**None**|**Type:** `array`<br/>|
| `global.connectivity.network.pods.cidrBlocks[*]` |IPv4 address range, in CIDR notation.|**Type:** `string`<br/>**Example:** `"10.244.0.0/16"`<br/>**Value pattern:** `^((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)(/([0-9]|[1,2][0-9]|[3][0-2]))?$`<br/>|
| `global.connectivity.network.services` | **Services**|**Type:** `object`<br/>|
| `global.connectivity.network.services.cidrBlocks` |**None**|**Type:** `array`<br/>|
| `global.connectivity.network.services.cidrBlocks[*]` |IPv4 address range, in CIDR notation.|**Type:** `string`<br/>**Example:** `"10.244.0.0/16"`<br/>**Value pattern:** `^((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)(/([0-9]|[1,2][0-9]|[3][0-2]))?$`<br/>|
| `global.connectivity.proxy` | **Proxy** - Whether/how outgoing traffic is routed through proxy servers.|**Type:** `object`<br/>|
| `global.connectivity.proxy.enabled` | **Enable**|**Type:** `boolean`<br/>|
| `global.connectivity.proxy.httpProxy` | **HTTP proxy** - HTTP proxy - To be passed to the HTTP_PROXY environment variable in all hosts.|**Type:** `string`<br/>|
| `global.connectivity.proxy.httpsProxy` | **HTTPS proxy** - HTTPS proxy - To be passed to the HTTPS_PROXY environment variable in all hosts.|**Type:** `string`<br/>|
| `global.connectivity.proxy.noProxy` | **No proxy** - No proxy - Comma-separated addresses to be passed to the NO_PROXY environment variable in all hosts.|**Type:** `string`<br/>|

### Control plane
Properties within the `.global.controlPlane` object

| **Property** | **Description** | **More Details** |
| :----------- | :-------------- | :--------------- |
| `global.controlPlane.machineHealthCheck` | **Machine health check**|**Type:** `object`<br/>|
| `global.controlPlane.machineHealthCheck.enabled` | **Enabled** - Enable machine health checks.|**Type:** `boolean`<br/>**Default:** `true`|
| `global.controlPlane.machineHealthCheck.maxUnhealthy` | **Max unhealthy** - Maximum number or percentage of unhealthy nodes.|**Type:** `string`<br/>**Default:** `"40%"`|
| `global.controlPlane.machineHealthCheck.nodeStartupTimeout` | **Node startup timeout** - Time to wait for a node to become healthy.|**Type:** `string`<br/>**Default:** `"20m0s"`|
| `global.controlPlane.machineHealthCheck.unhealthyNotReadyTimeout` | **Unhealthy not ready timeout** - Time to wait for a node to become ready.|**Type:** `string`<br/>**Default:** `"10m0s"`|
| `global.controlPlane.machineHealthCheck.unhealthyUnknownTimeout` | **Unhealthy unknown timeout** - Time to wait for a node to become known.|**Type:** `string`<br/>**Default:** `"10m0s"`|
| `global.controlPlane.machineTemplate` | **Template to define control plane nodes**|**Type:** `object`<br/>|
| `global.controlPlane.machineTemplate.description` |Description for the VMs.|**Type:** `string`<br/>|
| `global.controlPlane.machineTemplate.disks` | **VM disk configuration**|**Type:** `object`<br/>|
| `global.controlPlane.machineTemplate.disks.bootVolume` | **Boot volume configuration**|**Type:** `object`<br/>|
| `global.controlPlane.machineTemplate.disks.bootVolume.disk` | **Disk name** - Name of the boot disk to be resized.|**Type:** `string`<br/>|
| `global.controlPlane.machineTemplate.disks.bootVolume.sizeGb` | **Disk size** - Target size in GB. Must be larger than template disk size.|**Type:** `integer`<br/>|
| `global.controlPlane.machineTemplate.format` |Format of the cloned disk.|**Type:** `string`<br/>**Default:** `"raw"`|
| `global.controlPlane.machineTemplate.memoryMiB` |Memory size in MiB|**Type:** `integer`<br/>**Example:** `8192`<br/>|
| `global.controlPlane.machineTemplate.network` | **Network interface configuration**|**Type:** `object`<br/>|
| `global.controlPlane.machineTemplate.network.default` | **Default network interface configuration**|**Type:** `object`<br/>|
| `global.controlPlane.machineTemplate.network.default.bridge` | **Bridge name** - Name of network bridge to attach interface to.|**Type:** `string`<br/>|
| `global.controlPlane.machineTemplate.network.default.model` | **Device model** - Network device model.|**Type:** `string`<br/>|
| `global.controlPlane.machineTemplate.network.default.mtu` | **MTU** - Network device MTU. If set to '1', virtio devices inherit MTU from the attached bridge.|**Type:** `integer`<br/>|
| `global.controlPlane.machineTemplate.network.default.vlan` | **VLAN ID** - VLAN ID to tag interface with.|**Type:** `integer`<br/>|
| `global.controlPlane.machineTemplate.numCores` |Number of CPU cores|**Type:** `integer`<br/>**Example:** `6`<br/>|
| `global.controlPlane.machineTemplate.numSockets` |Number of CPU sockets|**Type:** `integer`<br/>**Example:** `6`<br/>|
| `global.controlPlane.machineTemplate.pool` |Name of the resource pool to add VMs to.|**Type:** `string`<br/>|
| `global.controlPlane.machineTemplate.sourceNode` |Name of the initial node to operate against.|**Type:** `string`<br/>|
| `global.controlPlane.machineTemplate.storage` |Name of the storage for the cloned disk.|**Type:** `string`<br/>|
| `global.controlPlane.machineTemplate.templateID` |ID of the VM template to clone.|**Type:** `integer`<br/>|
| `global.controlPlane.machineTemplate.vmIDRange` |VM ID range|**Type:** `object`<br/>|
| `global.controlPlane.machineTemplate.vmIDRange.end` |End of the VM ID range.|**Type:** `integer`<br/>|
| `global.controlPlane.machineTemplate.vmIDRange.start` |Start of the VM ID range.|**Type:** `integer`<br/>|
| `global.controlPlane.oidc` | **OIDC authentication**|**Type:** `object`<br/>|
| `global.controlPlane.oidc.caPem` | **Certificate authority file** - Path to identity provider's CA certificate in PEM format.|**Type:** `string`<br/>|
| `global.controlPlane.oidc.clientId` | **Client ID** - OIDC client identifier to identify with.|**Type:** `string`<br/>|
| `global.controlPlane.oidc.groupsClaim` | **Groups claim** - Name of the identity token claim bearing the user's group memberships.|**Type:** `string`<br/>|
| `global.controlPlane.oidc.issuerUrl` | **Issuer URL** - URL of the provider which allows the API server to discover public signing keys, not including any path. Discovery URL without the '/.well-known/openid-configuration' part.|**Type:** `string`<br/>|
| `global.controlPlane.oidc.usernameClaim` | **Username claim** - Name of the identity token claim bearing the unique user identifier.|**Type:** `string`<br/>|
| `global.controlPlane.replicas` |Replica count.|**Type:** `integer`<br/>**Example:** `3`<br/>|

### Metadata
Properties within the `.global.metadata` object

| **Property** | **Description** | **More Details** |
| :----------- | :-------------- | :--------------- |
| `global.metadata.description` | **Cluster description** - User-friendly description of the cluster's purpose.|**Type:** `string`<br/>|
| `global.metadata.labels` | **Labels** - These labels are added to the Kubernetes resources defining this cluster.|**Type:** `object`<br/>|
| `global.metadata.labels.PATTERN` | **Label**|**Type:** `string`<br/>**Key pattern:**<br/>`PATTERN`=`^[a-zA-Z0-9/\._-]+$`<br/>**Value pattern:** `^[a-zA-Z0-9\._-]+$`<br/>|
| `global.metadata.name` | **Cluster name**|**Type:** `string`<br/>|
| `global.metadata.organization` | **Organization**|**Type:** `string`<br/>|
| `global.metadata.preventDeletion` | **Prevent cluster deletion**|**Type:** `boolean`<br/>**Default:** `false`|
| `global.metadata.servicePriority` | **Service priority** - The relative importance of this cluster.|**Type:** `string`<br/>**Default:** `"highest"`|

### Node pools
Properties within the `.global.nodePools` object
Groups of worker nodes with identical configuration.

| **Property** | **Description** | **More Details** |
| :----------- | :-------------- | :--------------- |
| `global.nodePools.PATTERN` |**None**|**Type:** `object`<br/>**Key pattern:**<br/>`PATTERN`=`^[a-z0-9-]{3,10}$`<br/>|
| `global.nodePools.worker` | **Default nodePool**|**Type:** `object`<br/>|
| `global.nodePools.worker.description` |Description for the VMs.|**Type:** `string`<br/>|
| `global.nodePools.worker.disks` | **VM disk configuration**|**Type:** `object`<br/>|
| `global.nodePools.worker.disks.bootVolume` | **Boot volume configuration**|**Type:** `object`<br/>|
| `global.nodePools.worker.disks.bootVolume.disk` | **Disk name** - Name of the boot disk to be resized.|**Type:** `string`<br/>|
| `global.nodePools.worker.disks.bootVolume.sizeGb` | **Disk size** - Target size in GB. Must be larger than template disk size.|**Type:** `integer`<br/>|
| `global.nodePools.worker.format` |Format of the cloned disk.|**Type:** `string`<br/>**Default:** `"raw"`|
| `global.nodePools.worker.memoryMiB` |Memory size in MiB|**Type:** `integer`<br/>**Example:** `8192`<br/>|
| `global.nodePools.worker.network` | **Network interface configuration**|**Type:** `object`<br/>|
| `global.nodePools.worker.network.default` | **Default network interface configuration**|**Type:** `object`<br/>|
| `global.nodePools.worker.network.default.bridge` | **Bridge name** - Name of network bridge to attach interface to.|**Type:** `string`<br/>|
| `global.nodePools.worker.network.default.model` | **Device model** - Network device model.|**Type:** `string`<br/>|
| `global.nodePools.worker.network.default.mtu` | **MTU** - Network device MTU. If set to '1', virtio devices inherit MTU from the attached bridge.|**Type:** `integer`<br/>|
| `global.nodePools.worker.network.default.vlan` | **VLAN ID** - VLAN ID to tag interface with.|**Type:** `integer`<br/>|
| `global.nodePools.worker.numCores` |Number of CPU cores|**Type:** `integer`<br/>**Example:** `6`<br/>|
| `global.nodePools.worker.numSockets` |Number of CPU sockets|**Type:** `integer`<br/>**Example:** `6`<br/>|
| `global.nodePools.worker.pool` |Name of the resource pool to add VMs to.|**Type:** `string`<br/>|
| `global.nodePools.worker.replicas` |Replica count.|**Type:** `integer`<br/>**Example:** `3`<br/>|
| `global.nodePools.worker.sourceNode` |Name of the initial node to operate against.|**Type:** `string`<br/>|
| `global.nodePools.worker.storage` |Name of the storage for the cloned disk.|**Type:** `string`<br/>|
| `global.nodePools.worker.templateID` |ID of the VM template to clone.|**Type:** `integer`<br/>|
| `global.nodePools.worker.vmIDRange` |VM ID range|**Type:** `object`<br/>|
| `global.nodePools.worker.vmIDRange.end` |End of the VM ID range.|**Type:** `integer`<br/>|
| `global.nodePools.worker.vmIDRange.start` |Start of the VM ID range.|**Type:** `integer`<br/>|

### Other global

| **Property** | **Description** | **More Details** |
| :----------- | :-------------- | :--------------- |
| `global.managementCluster` | **Management cluster** - Name of the Cluster API cluster managing this workload cluster.|**Type:** `string`<br/>|

### Pod Security Standards
Properties within the `.global.podSecurityStandards` object

| **Property** | **Description** | **More Details** |
| :----------- | :-------------- | :--------------- |
| `global.podSecurityStandards.enforced` | **Enforced Pod Security Standards** - Use PSSs instead of PSPs.|**Type:** `boolean`<br/>**Default:** `true`|

### Provider specific configuration
Properties within the `.global.providerSpecific` object

| **Property** | **Description** | **More Details** |
| :----------- | :-------------- | :--------------- |
| `global.providerSpecific.proxmox` | **Proxmox** - Configuration for Proxmox API access.|**Type:** `object`<br/>|
| `global.providerSpecific.proxmox.allowedNodes` | **Allowed nodes** - List of nodes to be used for VM deployment.|**Type:** `array`<br/>**Examples:** `"node1", "node2"`<br/>**Default:** `[]`|
| `global.providerSpecific.proxmox.allowedNodes[*]` |**None**|**Type:** `string`<br/>|
| `global.providerSpecific.proxmox.dnsServers` | **DNS servers** - DNS servers for machine network-config.|**Type:** `array`<br/>**Example:** `"10.0.0.10"`<br/>|
| `global.providerSpecific.proxmox.dnsServers[*]` |**None**|**Type:** `string`<br/>|
| `global.providerSpecific.proxmox.ipv4Config` | **IPv4 configuration** - Configuration for IPv4 addresses.|**Type:** `object`<br/>|
| `global.providerSpecific.proxmox.ipv4Config.addresses` | **IP addresses** - IP address ranges to be used for VMs.|**Type:** `array`<br/>**Example:** `"10.0.0.100-10.0.0.200"`<br/>|
| `global.providerSpecific.proxmox.ipv4Config.addresses[*]` |**None**|**Type:** `string`<br/>|
| `global.providerSpecific.proxmox.ipv4Config.gateway` | **Gateway** - IPv4 address of the gateway.|**Type:** `string`<br/>|
| `global.providerSpecific.proxmox.ipv4Config.prefix` | **Netmask** - Subnet netmask in CIDR notation.|**Type:** `integer`<br/>**Example:** `24`<br/>|
| `global.providerSpecific.proxmox.secret` | **Secret** - Secret associated with the token ID.|**Type:** `string`<br/>|
| `global.providerSpecific.proxmox.token` | **Token** - Token ID for authentication.|**Type:** `string`<br/>|
| `global.providerSpecific.proxmox.url` | **URL** - Proxmox VE API URL.|**Type:** `string`<br/>|

### Release
Properties within the `.global.release` object
Information about the workload cluster release.

| **Property** | **Description** | **More Details** |
| :----------- | :-------------- | :--------------- |
| `global.release.version` | **Version**|**Type:** `string`<br/>|

### Other

| **Property** | **Description** | **More Details** |
| :----------- | :-------------- | :--------------- |
| `baseDomain` | **Base DNS domain**|**Type:** `string`<br/>|
| `cluster` | **Cluster** - Helm values for the provider-independent cluster chart.|**Type:** `object`<br/>**Default:** `{"providerIntegration":{"apps":{"capiNodeLabeler":{"enable":true},"certExporter":{"configTemplateName":"proxmoxCertExporterHelmValues","enable":true},"certManager":{"configTemplateName":"proxmoxCertManagerHelmValues","enable":true},"chartOperatorExtensions":{"enable":true},"cilium":{"configTemplateName":"proxmoxCiliumHelmValues","enable":true},"ciliumServiceMonitors":{"enable":true},"coreDns":{"enable":true},"etcdKubernetesResourcesCountExporter":{"enable":true},"k8sDnsNodeCache":{"enable":true},"metricsServer":{"enable":true},"netExporter":{"enable":true},"networkPolicies":{"configTemplateName":"proxmoxNetworkPoliciesHelmValues","enable":true},"nodeExporter":{"configTemplateName":"proxmoxNodeExporterHelmValues","enable":true},"observabilityBundle":{"enable":true},"observabilityPolicies":{"enable":true},"securityBundle":{"enable":true},"teleportKubeAgent":{"enable":true},"verticalPodAutoscaler":{"enable":true},"verticalPodAutoscalerCrd":{"enable":true}},"controlPlane":{"kubeadmConfig":{"files":[{"contentFrom":{"secret":{"key":"content","name":"kubevip-pod","prependClusterNameAsPrefix":true}},"path":"/etc/kubernetes/manifests/kube-vip.yaml","permissions":"0600"}],"postKubeadmCommands":["sed --in-place \"s|/etc/kubernetes/super-admin.conf|/etc/kubernetes/admin.conf|g\" /etc/kubernetes/manifests/kube-vip.yaml"]},"resources":{"infrastructureMachineTemplate":{"group":"infrastructure.cluster.x-k8s.io","kind":"ProxmoxMachineTemplate","version":"v1alpha1"},"infrastructureMachineTemplateSpecTemplateName":"controlplane-proxmoxmachinetemplate-spec"}},"environmentVariables":{"hostName":"COREOS_CUSTOM_HOSTNAME","ipv4":"COREOS_CUSTOM_IPV4"},"kubeadmConfig":{"enableGiantswarmUser":true,"files":[{"contentFrom":{"secret":{"key":"set-hostname.sh","name":"provider-specific-files-1","prependClusterNameAsPrefix":true}},"path":"/opt/bin/set-hostname.sh","permissions":"0755"}],"ignition":{"containerLinuxConfig":{"additionalConfig":{"systemd":{"units":[{"contents":{"install":{"wantedBy":["multi-user.target"]},"service":{"environmentFile":["/etc/proxmox-env"],"execStart":["/usr/bin/mkdir --parent /run/metadata","/bin/bash -c 'env \u003e /run/metadata/coreos'"],"remainAfterExit":"yes","restart":"on-failure","type":"oneshot"},"unit":{"after":["network-online.target","nss-lookup.target"],"description":"Proxmox metadata agent","wants":["network-online.target"]}},"enabled":true,"name":"coreos-metadata.service"},{"contents":{"install":{"wantedBy":["multi-user.target"]},"unit":{"description":"Set machine hostname"}},"dropins":[{"contents":"[Unit]\nRequires=coreos-metadata.service\nAfter=coreos-metadata.service\nBefore=teleport.service\n[Service]\nType=oneshot\nRemainAfterExit=yes\nEnvironmentFile=/run/metadata/coreos\nExecStart=/opt/bin/set-hostname.sh","name":"10-set-hostname.conf"}],"enabled":true,"name":"set-hostname.service"},{"contents":{"install":{"wantedBy":["default.target"]},"unit":{"description":"Disable TCP segmentation offloading"}},"dropins":[{"contents":"[Unit]\nAfter=network.target\n[Service]\nType=oneshot\nRemainAfterExit=yes\nExecStart=/usr/sbin/ethtool -K ens192 tx-udp_tnl-csum-segmentation off\nExecStart=/usr/sbin/ethtool -K ens192 tx-udp_tnl-segmentation off","name":"10-ethtool-segmentation.conf"}],"enabled":true,"name":"ethtool-segmentation.service"}]}}}},"postKubeadmCommands":["usermod -aG root nobody"]},"pauseProperties":{"global.connectivity.network.controlPlaneEndpoint.host":""},"provider":"proxmox","resourcesApi":{"bastionResourceEnabled":false,"cleanupHelmReleaseResourcesEnabled":true,"helmRepositoryResourcesEnabled":true,"infrastructureCluster":{"group":"infrastructure.cluster.x-k8s.io","kind":"ProxmoxCluster","version":"v1alpha1"},"infrastructureMachinePool":{"group":"infrastructure.cluster.x-k8s.io","kind":"ProxmoxMachineTemplate","version":"v1alpha1"},"nodePoolKind":"MachineDeployment"},"useReleases":false,"workers":{"defaultNodePools":{"def00":{"disks":{"bootVolume":{"disk":"scsi0","sizeGb":50}},"machineHealthCheck":{"enabled":true,"maxUnhealthy":"40%","nodeStartupTimeout":"20m0s","unhealthyNotReadyTimeout":"10m0s","unhealthyUnknownTimeout":"10m0s"},"memoryMiB":8192,"network":{"default":{"bridge":"vmbr0"}},"numCores":1,"numSockets":1,"sourceNode":"pve","templateID":100}},"resources":{"infrastructureMachineTemplateSpecTemplateName":"worker-proxmoxmachinetemplate-spec"}}}}`|
| `cluster-shared` | **Library chart**|**Type:** `object`<br/>|
| `managementCluster` | **Management cluster name**|**Type:** `string`<br/>|
| `provider` | **Provider name**|**Type:** `string`<br/>|



<!-- DOCS_END -->


