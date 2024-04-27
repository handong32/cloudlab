# Validation of Intel PMC between Linux and EbbRT

## Linux Perf Stat
~~~
hand32@serverebbrt:~/peakler/experiments/microbenchmarks$ cat loop.c
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char ** argv)
{
  unsigned int i;
  unsigned int ans;
  unsigned int loop;

  if(argc != 2) {
    return 0;
  }

  ans = 0;
  loop = atoi(argv[1]);
  for(i=0;i<loop;i++) {
    ans ++;
  }

  printf("ans = %u\n", ans);
  return 0;
}

hand32@serverebbrt:~/peakler/experiments/microbenchmarks$ perf stat -e instructions,cache-misses,ref-cycles -x, ./loop 10000000
ans = 10000000
50821384,,instructions,30333633,100.00,,
144,,cache-misses,30333633,100.00,,
72405192,,ref-cycles,30333633,100.00,,
hand32@serverebbrt:~/peakler/experiments/microbenchmarks$ perf stat -e instructions,cache-misses,ref-cycles -x, ./loop 10000000
ans = 10000000
50825167,,instructions,29264611,100.00,,
202,,cache-misses,29264611,100.00,,
69883152,,ref-cycles,29264611,100.00,,
hand32@serverebbrt:~/peakler/experiments/microbenchmarks$ perf stat -e instructions,cache-misses,ref-cycles -x, ./loop 10000000
ans = 10000000
50816061,,instructions,30363617,100.00,,
68,,cache-misses,30363617,100.00,,
72456408,,ref-cycles,30363617,100.00,,
hand32@serverebbrt:~/peakler/experiments/microbenchmarks$ perf stat -e instructions,cache-misses,ref-cycles -x, ./loop 20000000
ans = 20000000
100843959,,instructions,55362330,100.00,,
117,,cache-misses,55362330,100.00,,
132278016,,ref-cycles,55362330,100.00,,
hand32@serverebbrt:~/peakler/experiments/microbenchmarks$ perf stat -e instructions,cache-misses,ref-cycles -x, ./loop 20000000
ans = 20000000
100856314,,instructions,54663906,100.00,,
52,,cache-misses,54663906,100.00,,
130616496,,ref-cycles,54663906,100.00,,
hand32@serverebbrt:~/peakler/experiments/microbenchmarks$ perf stat -e instructions,cache-misses,ref-cycles -x, ./loop 20000000
ans = 20000000
100871592,,instructions,55344882,100.00,,
56,,cache-misses,55344882,100.00,,
132197808,,ref-cycles,55344882,100.00,,
hand32@serverebbrt:~/peakler/experiments/microbenchmarks$ perf stat -e instructions,cache-misses,ref-cycles -x, ./loop 30000000
ans = 30000000
150930148,,instructions,79658991,100.00,,
215,,cache-misses,79658991,100.00,,
190388304,,ref-cycles,79658991,100.00,,
hand32@serverebbrt:~/peakler/experiments/microbenchmarks$ perf stat -e instructions,cache-misses,ref-cycles -x, ./loop 30000000
ans = 30000000
150899144,,instructions,80182533,100.00,,
136,,cache-misses,80182533,100.00,,
191594400,,ref-cycles,80182533,100.00,,
hand32@serverebbrt:~/peakler/experiments/microbenchmarks$ perf stat -e instructions,cache-misses,ref-cycles -x, ./loop 30000000
ans = 30000000
150907221,,instructions,81642135,100.00,,
90,,cache-misses,81642135,100.00,,
195139200,,ref-cycles,81642135,100.00,,
~~~

## Linux with Custom PCM tool
~~~
root@serverebbrt:~/peakler/experiments/microbenchmarks# ./loop 10000000
ans: 10000000, INS: 50124693, REF_CYC: 75721728, LLC: 64
root@serverebbrt:~/peakler/experiments/microbenchmarks# ./loop 10000000
ans: 10000000, INS: 50081833, REF_CYC: 74427552, LLC: 12
root@serverebbrt:~/peakler/experiments/microbenchmarks# ./loop 10000000
ans: 10000000, INS: 50083781, REF_CYC: 73734120, LLC: 40
root@serverebbrt:~/peakler/experiments/microbenchmarks# ./loop 20000000
ans: 20000000, INS: 100192365, REF_CYC: 136113744, LLC: 68
root@serverebbrt:~/peakler/experiments/microbenchmarks# ./loop 20000000
ans: 20000000, INS: 100168728, REF_CYC: 132728472, LLC: 103
root@serverebbrt:~/peakler/experiments/microbenchmarks# ./loop 20000000
ans: 20000000, INS: 100146979, REF_CYC: 136387152, LLC: 59
root@serverebbrt:~/peakler/experiments/microbenchmarks# ./loop 30000000
ans: 30000000, INS: 150187337, REF_CYC: 193976688, LLC: 41
root@serverebbrt:~/peakler/experiments/microbenchmarks# ./loop 30000000
ans: 30000000, INS: 150178428, REF_CYC: 194271336, LLC: 64
root@serverebbrt:~/peakler/experiments/microbenchmarks# ./loop 30000000
ans: 30000000, INS: 150175979, REF_CYC: 192305304, LLC: 38

read_msr: 0x309
perfevent::fixed_instructions: 0x309
read_msr: 0x38d
PerfCounter() pwrite: fixed_ctrl.val=0xb7 kIa32FixedCtrCtrlMsr=0x38d
Start pwrite: perf_global_ctrl=0x100000000 kIa32PerfGlobalCtrlMsr=0x38f
run loop start
read_msr: 0x309
read_msr: 0x309
run loop stop
ans: 10000, INS: 63176
run loop start
read_msr: 0x309
read_msr: 0x309
run loop stop
ans: 30000, INS: 133744
Stop pwrite: perf_global_ctrl=0x0 kIa32PerfGlobalCtrlMsr=0x38f
~PerfCounter pwrite: perf_global_ctrl=0x0 kIa32PerfGlobalCtrlMsr=0x38f
read_msr: 0x38d
~PerfCounter() pwrite: fixed_ctrl.val=0x7fffdc12f0bc kIa32FixedCtrCtrlMsr=0x38d
~~~

## Linux with libpcf
~~~
pfc: Kernel Module loading on processor Intel(R) Xeon(R) CPU E5-2630 v3 @ 2.40GHz (Family 6 (6), Model 63 (03F), Stepping 2 (2))
pfc: cpuid.0x0.0x0:        EAX=0000000f, EBX=756e6547, ECX=6c65746e, EDX=49656e69
pfc: cpuid.0x1.0x0:        EAX=000306f2, EBX=09100800, ECX=7ffefbff, EDX=bfebfbff
pfc: cpuid.0x6.0x0:        EAX=00000077, EBX=00000002, ECX=00000009, EDX=00000000
pfc: cpuid.0xA.0x0:        EAX=07300403, EBX=00000000, ECX=00000000, EDX=00000603
pfc: cpuid.0x80000000.0x0: EAX=80000008, EBX=00000000, ECX=00000000, EDX=00000000
pfc: cpuid.0x80000001.0x0: EAX=00000000, EBX=00000000, ECX=00000021, EDX=2c100800
pfc: cpuid.0x80000002.0x0: EAX=65746e49, EBX=2952286c, ECX=6f655820, EDX=2952286e
pfc: cpuid.0x80000003.0x0: EAX=55504320, EBX=2d354520, ECX=30333632, EDX=20337620
pfc: cpuid.0x80000004.0x0: EAX=2e322040, EBX=48473034, ECX=0000007a, EDX=00000000
pfcRDMSR addr=0x345
pfc: PM Arch Version:      3
pfc: Fixed-function  PMCs: 3	Mask 0000ffffffffffff (48 bits)
pfc: General-purpose PMCs: 4	Mask 0000ffffffffffff (48 bits)
pfcRDMSR addr=0x38f
pfcWRMSR: add=0x38f newVal=0x0
pfcRDMSR addr=0x38d
pfcWRMSR: add=0x38d newVal=0x0
pfcRDMSR addr=0x309
pfcWRMSR: add=0x309 newVal=0x0
pfcRDMSR addr=0x30a
pfcWRMSR: add=0x30a newVal=0x0
pfcRDMSR addr=0x30b
pfcWRMSR: add=0x30b newVal=0x0
pfcInitCounters CPU 3 done
pfc: Module pfc loaded successfully. Make sure to execute
pfc:     modprobe -ar iTCO_wdt iTCO_vendor_support
pfc:     echo 0 > /proc/sys/kernel/nmi_watchdog
pfc: and blacklist iTCO_vendor_support and iTCO_wdt, since the CR4.PCE register
pfc: initialization is periodically undone by an unknown agent.
pfcRDMSR addr=0x38f
pfcRDMSR addr=0x38f
pfcWRMSR: add=0x38f newVal=0x0
pfcRDMSR addr=0x38d
pfcRDMSR addr=0x38d
pfcWRMSR: add=0x38d newVal=0x2
pfcRDMSR addr=0x38d
pfcRDMSR addr=0x38f
pfcRDMSR addr=0x38f
pfcWRMSR: add=0x38f newVal=0x100000000
pfcRDMSR addr=0x38f
pfcRDMSR addr=0x38f
pfcWRMSR: add=0x38f newVal=0x100000000
pfcRDMSR addr=0x38d
pfcRDMSR addr=0x38d
pfcWRMSR: add=0x38d newVal=0x22
pfcRDMSR addr=0x38d
pfcRDMSR addr=0x38f
pfcRDMSR addr=0x38f
pfcWRMSR: add=0x38f newVal=0x300000000
pfcRDMSR addr=0x38f
pfcRDMSR addr=0x38f
pfcWRMSR: add=0x38f newVal=0x300000000
pfcRDMSR addr=0x38d
pfcRDMSR addr=0x38d
pfcWRMSR: add=0x38d newVal=0x222
pfcRDMSR addr=0x38d
pfcRDMSR addr=0x38f
pfcRDMSR addr=0x38f
pfcWRMSR: add=0x38f newVal=0x700000000
pfcRDMSR addr=0x38f
pfcRDMSR addr=0x38f
pfcWRMSR: add=0x38f newVal=0x700000000
pfcRDMSR addr=0x186
pfcWRMSR: add=0x186 newVal=0x0
pfcRDMSR addr=0x186
pfcRDMSR addr=0x38f
pfcRDMSR addr=0x38f
pfcWRMSR: add=0x38f newVal=0x700000000
pfcRDMSR addr=0x187
pfcWRMSR: add=0x187 newVal=0x0
pfcRDMSR addr=0x187
pfcRDMSR addr=0x38f
pfcRDMSR addr=0x38f
pfcWRMSR: add=0x38f newVal=0x700000000
pfcRDMSR addr=0x188
pfcWRMSR: add=0x188 newVal=0x0
pfcRDMSR addr=0x188
pfcRDMSR addr=0x38f
pfcRDMSR addr=0x38f
pfcWRMSR: add=0x38f newVal=0x700000000
pfcRDMSR addr=0x189
pfcWRMSR: add=0x189 newVal=0x0
pfcRDMSR addr=0x189
pfcRDMSR addr=0x309
pfcWRMSR: add=0x309 newVal=0x0
pfcRDMSR addr=0x30a
pfcWRMSR: add=0x30a newVal=0x0
pfcRDMSR addr=0x30b
pfcWRMSR: add=0x30b newVal=0x0
pfcRDMSR addr=0x4c1
pfcWRMSR: add=0x4c1 newVal=0x0
pfcRDMSR addr=0x4c2
pfcWRMSR: add=0x4c2 newVal=0x0
pfcRDMSR addr=0x4c3
pfcWRMSR: add=0x4c3 newVal=0x0
pfcRDMSR addr=0x4c4
pfcWRMSR: add=0x4c4 newVal=0x0
~~~
