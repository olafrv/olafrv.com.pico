---
title: Stonith Plugin Agent for VMWare VM VCenter SOAP Fencing (Unofficial)
created: 2015/01/19
image: peacemaker.png
---

Helpful when stonith version does not include "fence_vmare_soap" plugin agent, some cases are: 

  * Canonical Ubuntu Linux 14.04 LTS
  * SUSE Enterprise Linux 11 SP3

Download and documentation at: <https://github.com/olafrv/fence_vmware_soap> 

#### Plugin Workflow

- stonithd (Cluster Fencing Daemon)
- /usr/lib/stonith/plugins/external/fence_vmware_soap (Stonith Plugin Agent)
- /usr/sbin/fence_vmware_soap (SOAP Fence Request, provided by fence-agents)
- VMWareVCenter (SOAP Web Service, Authentication, Search, Triggering)
- VMWare ESXi Hypervisor (Virtual Machine On/Off). 

#### Notice

Right now the plugin not permits declaring two diferent VMWare VCenter devices for fencing the same list of cluster nodes. But could be tested and implemented changing the attribute "unique" to "false" for the "hostlist" parameter in the plugin XML definition schema.

#### References

For more information, about the stonith plugin agents visit the following links: \- 8.1. STONITH Agents: https://doc.opensuse.org/products/draft/SLE-HA/SLE-ha-guide_sd_draft/cha.ha.agents.html \- External STONITH Plugins: https://www.linux-ha.org/ExternalStonithPl
