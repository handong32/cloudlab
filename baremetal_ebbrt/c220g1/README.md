
## other info
~~~
hand32@serverebbrt:~/cloudlab/baremetal_ebbrt/c220g1$ numactl -H
available: 2 nodes (0-1)
node 0 cpus: 0 1 2 3 4 5 6 7
node 0 size: 64174 MB
node 0 free: 63422 MB
node 1 cpus: 8 9 10 11 12 13 14 15
node 1 size: 64459 MB
node 1 free: 64023 MB
node distances:
node   0   1 
  0:  10  21 
  1:  21  10

hand32@serverebbrt:~/cloudlab/baremetal_ebbrt/c220g1$ cpufreq-info 
cpufrequtils 008: cpufreq-info (C) Dominik Brodowski 2004-2009
Report errors and bugs to cpufreq@vger.kernel.org, please.
analyzing CPU 0:
  driver: intel_cpufreq
  CPUs which run at the same hardware frequency: 0
  CPUs which need to have their frequency coordinated by software: 0
  maximum transition latency: 20.0 us.
  hardware limits: 1.20 GHz - 3.20 GHz
  available cpufreq governors: conservative, ondemand, userspace, powersave, performance, schedutil
  current policy: frequency should be within 1.20 GHz and 3.20 GHz.
                  The governor "performance" may decide which speed to use
                  within this range.
  current CPU frequency is 1.20 GHz.
analyzing CPU 1:
  driver: intel_cpufreq
  CPUs which run at the same hardware frequency: 1
  CPUs which need to have their frequency coordinated by software: 1
  maximum transition latency: 20.0 us.
  hardware limits: 1.20 GHz - 3.20 GHz
  available cpufreq governors: conservative, ondemand, userspace, powersave, performance, schedutil
  current policy: frequency should be within 1.20 GHz and 3.20 GHz.
                  The governor "performance" may decide which speed to use
                  within this range.
  current CPU frequency is 1.20 GHz.
analyzing CPU 2:
  driver: intel_cpufreq
  CPUs which run at the same hardware frequency: 2
  CPUs which need to have their frequency coordinated by software: 2
  maximum transition latency: 20.0 us.
  hardware limits: 1.20 GHz - 3.20 GHz
  available cpufreq governors: conservative, ondemand, userspace, powersave, performance, schedutil
  current policy: frequency should be within 1.20 GHz and 3.20 GHz.
                  The governor "performance" may decide which speed to use
                  within this range.
  current CPU frequency is 1.20 GHz.
analyzing CPU 3:
  driver: intel_cpufreq
  CPUs which run at the same hardware frequency: 3
  CPUs which need to have their frequency coordinated by software: 3
  maximum transition latency: 20.0 us.
  hardware limits: 1.20 GHz - 3.20 GHz
  available cpufreq governors: conservative, ondemand, userspace, powersave, performance, schedutil
  current policy: frequency should be within 1.20 GHz and 3.20 GHz.
                  The governor "performance" may decide which speed to use
                  within this range.
  current CPU frequency is 1.90 GHz.
analyzing CPU 4:
  driver: intel_cpufreq
  CPUs which run at the same hardware frequency: 4
  CPUs which need to have their frequency coordinated by software: 4
  maximum transition latency: 20.0 us.
  hardware limits: 1.20 GHz - 3.20 GHz
  available cpufreq governors: conservative, ondemand, userspace, powersave, performance, schedutil
  current policy: frequency should be within 1.20 GHz and 3.20 GHz.
                  The governor "performance" may decide which speed to use
                  within this range.
  current CPU frequency is 1.20 GHz.
analyzing CPU 5:
  driver: intel_cpufreq
  CPUs which run at the same hardware frequency: 5
  CPUs which need to have their frequency coordinated by software: 5
  maximum transition latency: 20.0 us.
  hardware limits: 1.20 GHz - 3.20 GHz
  available cpufreq governors: conservative, ondemand, userspace, powersave, performance, schedutil
  current policy: frequency should be within 1.20 GHz and 3.20 GHz.
                  The governor "performance" may decide which speed to use
                  within this range.
  current CPU frequency is 2.39 GHz.
analyzing CPU 6:
  driver: intel_cpufreq
  CPUs which run at the same hardware frequency: 6
  CPUs which need to have their frequency coordinated by software: 6
  maximum transition latency: 20.0 us.
  hardware limits: 1.20 GHz - 3.20 GHz
  available cpufreq governors: conservative, ondemand, userspace, powersave, performance, schedutil
  current policy: frequency should be within 1.20 GHz and 3.20 GHz.
                  The governor "performance" may decide which speed to use
                  within this range.
  current CPU frequency is 1.20 GHz.
analyzing CPU 7:
  driver: intel_cpufreq
  CPUs which run at the same hardware frequency: 7
  CPUs which need to have their frequency coordinated by software: 7
  maximum transition latency: 20.0 us.
  hardware limits: 1.20 GHz - 3.20 GHz
  available cpufreq governors: conservative, ondemand, userspace, powersave, performance, schedutil
  current policy: frequency should be within 1.20 GHz and 3.20 GHz.
                  The governor "performance" may decide which speed to use
                  within this range.
  current CPU frequency is 1.20 GHz.
analyzing CPU 8:
  driver: intel_cpufreq
  CPUs which run at the same hardware frequency: 8
  CPUs which need to have their frequency coordinated by software: 8
  maximum transition latency: 20.0 us.
  hardware limits: 1.20 GHz - 3.20 GHz
  available cpufreq governors: conservative, ondemand, userspace, powersave, performance, schedutil
  current policy: frequency should be within 1.20 GHz and 3.20 GHz.
                  The governor "performance" may decide which speed to use
                  within this range.
  current CPU frequency is 3.01 GHz.
analyzing CPU 9:
  driver: intel_cpufreq
  CPUs which run at the same hardware frequency: 9
  CPUs which need to have their frequency coordinated by software: 9
  maximum transition latency: 20.0 us.
  hardware limits: 1.20 GHz - 3.20 GHz
  available cpufreq governors: conservative, ondemand, userspace, powersave, performance, schedutil
  current policy: frequency should be within 1.20 GHz and 3.20 GHz.
                  The governor "performance" may decide which speed to use
                  within this range.
  current CPU frequency is 1.20 GHz.
analyzing CPU 10:
  driver: intel_cpufreq
  CPUs which run at the same hardware frequency: 10
  CPUs which need to have their frequency coordinated by software: 10
  maximum transition latency: 20.0 us.
  hardware limits: 1.20 GHz - 3.20 GHz
  available cpufreq governors: conservative, ondemand, userspace, powersave, performance, schedutil
  current policy: frequency should be within 1.20 GHz and 3.20 GHz.
                  The governor "performance" may decide which speed to use
                  within this range.
  current CPU frequency is 1.20 GHz.
analyzing CPU 11:
  driver: intel_cpufreq
  CPUs which run at the same hardware frequency: 11
  CPUs which need to have their frequency coordinated by software: 11
  maximum transition latency: 20.0 us.
  hardware limits: 1.20 GHz - 3.20 GHz
  available cpufreq governors: conservative, ondemand, userspace, powersave, performance, schedutil
  current policy: frequency should be within 1.20 GHz and 3.20 GHz.
                  The governor "performance" may decide which speed to use
                  within this range.
  current CPU frequency is 1.20 GHz.
analyzing CPU 12:
  driver: intel_cpufreq
  CPUs which run at the same hardware frequency: 12
  CPUs which need to have their frequency coordinated by software: 12
  maximum transition latency: 20.0 us.
  hardware limits: 1.20 GHz - 3.20 GHz
  available cpufreq governors: conservative, ondemand, userspace, powersave, performance, schedutil
  current policy: frequency should be within 1.20 GHz and 3.20 GHz.
                  The governor "performance" may decide which speed to use
                  within this range.
  current CPU frequency is 1.92 GHz.
analyzing CPU 13:
  driver: intel_cpufreq
  CPUs which run at the same hardware frequency: 13
  CPUs which need to have their frequency coordinated by software: 13
  maximum transition latency: 20.0 us.
  hardware limits: 1.20 GHz - 3.20 GHz
  available cpufreq governors: conservative, ondemand, userspace, powersave, performance, schedutil
  current policy: frequency should be within 1.20 GHz and 3.20 GHz.
                  The governor "performance" may decide which speed to use
                  within this range.
  current CPU frequency is 2.25 GHz.
analyzing CPU 14:
  driver: intel_cpufreq
  CPUs which run at the same hardware frequency: 14
  CPUs which need to have their frequency coordinated by software: 14
  maximum transition latency: 20.0 us.
  hardware limits: 1.20 GHz - 3.20 GHz
  available cpufreq governors: conservative, ondemand, userspace, powersave, performance, schedutil
  current policy: frequency should be within 1.20 GHz and 3.20 GHz.
                  The governor "performance" may decide which speed to use
                  within this range.
  current CPU frequency is 1.72 GHz.
analyzing CPU 15:
  driver: intel_cpufreq
  CPUs which run at the same hardware frequency: 15
  CPUs which need to have their frequency coordinated by software: 15
  maximum transition latency: 20.0 us.
  hardware limits: 1.20 GHz - 3.20 GHz
  available cpufreq governors: conservative, ondemand, userspace, powersave, performance, schedutil
  current policy: frequency should be within 1.20 GHz and 3.20 GHz.
                  The governor "performance" may decide which speed to use
                  within this range.
  current CPU frequency is 2.05 GHz.

hand32@serverebbrt:~/cloudlab/baremetal_ebbrt/c220g1$ sudo rdmsr -a 0x199
2000
2000
2000
2000
2000
2000
2000
2000
2000
2000
2000
2000
2000
2000
2000
2000

hand32@serverebbrt:~/bayop/uarch-configure/rapl-read$ sudo ./rapl-read -m

RAPL read -- use -s for sysfs, -p for perf_event, -m for msr

Found Haswell-EP Processor type
	0 (0), 1 (0), 2 (0), 3 (0), 4 (0), 5 (0), 6 (0), 7 (0)
	8 (1), 9 (1), 10 (1), 11 (1), 12 (1), 13 (1), 14 (1), 15 (1)
	
	Detected 16 cores in 2 packages


Trying /dev/msr interface to gather results

	Listing paramaters for package #0
DRAM: Using 0.000015 instead of 0.000061
		Power units = 0.125W
		CPU Energy units = 0.00006104J
		DRAM Energy units = 0.00001526J
		Time units = 0.00097656s

		Package thermal spec: 85.000W
		Package minimum power: 40.000W
		Package maximum power: 170.000W
		Package maximum time window: 0.045898s
		Package power limits are unlocked
		Package power limit #1: 85.000W for 0.009766s (enabled, clamped)
		Package power limit #2: 102.000W for 0.002930s (enabled, clamped)
	Listing paramaters for package #1
DRAM: Using 0.000015 instead of 0.000061
		Power units = 0.125W
		CPU Energy units = 0.00006104J
		DRAM Energy units = 0.00001526J
		Time units = 0.00097656s

		Package thermal spec: 85.000W
		Package minimum power: 40.000W
		Package maximum power: 170.000W
		Package maximum time window: 0.045898s
		Package power limits are unlocked
		Package power limit #1: 85.000W for 0.009766s (enabled, clamped)
		Package power limit #2: 102.000W for 0.002930s (enabled, clamped)

		Package before: 244929.621033J
		Package before: 690.653564J
		 1s Package energy: 15.840210J dram:4.324219J
		 1s Package energy: 15.542419J dram:4.128998J
		 1s Package energy: 15.550964J dram:4.171997J
		 1s Package energy: 14.719666J dram:4.219177J
		 1s Package energy: 14.407410J dram:4.205994J
		 1s Package energy: 14.511292J dram:4.196793J
		 1s Package energy: 15.285828J dram:4.143387J
		 1s Package energy: 15.541748J dram:4.213409J
		 1s Package energy: 15.530640J dram:4.238815J
		 1s Package energy: 15.552673J dram:4.199921J

~~~