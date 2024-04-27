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

## EbbRT PCM
~~~
Core 1 runins 1000000
Answer 1000000
100p  1 TcpCommand::Receive() 
    

[STATS] Core 0, Joules 249361, Instructions 400170, Cycles 6355809, RefCycles 11200680
[STATS] Core 1, Joules 252567, Instructions 9111376, Cycles 54131879, RefCycles 50587224
[STATS] Core 2, Joules 254001, Instructions 2890, Cycles 1538291, RefCycles 2032080
[STATS] Core 3, Joules 257202, Instructions 2754, Cycles 1556452, RefCycles 2052024
[STATS] Core 4, Joules 260097, Instructions 2802, Cycles 1459352, RefCycles 1934880
[STATS] Core 5, Joules 262949, Instructions 2754, Cycles 1513198, RefCycles 1995144
[STATS] Core 6, Joules 265784, Instructions 2846, Cycles 1520217, RefCycles 1997640
[STATS] Core 7, Joules 269041, Instructions 2754, Cycles 1547520, RefCycles 2040192
[STATS] Core 8, Joules 231590, Instructions 2827, Cycles 41139, RefCycles 82200
[STATS] Core 9, Joules 234199, Instructions 2875, Cycles 40305, RefCycles 70800
[STATS] Core 10, Joules 236564, Instructions 2832, Cycles 47741, RefCycles 78792
[STATS] Core 11, Joules 239392, Instructions 2940, Cycles 54985, RefCycles 85704
[STATS] Core 12, Joules 242249, Instructions 16498, Cycles 101462, RefCycles 179760
[STATS] Core 13, Joules 245096, Instructions 2883, Cycles 58638, RefCycles 87480
[STATS] Core 14, Joules 247960, Instructions 2791, Cycles 66263, RefCycles 96096
[STATS] Core 15, Joules 250837, Instructions 2968, Cycles 72221, RefCycles 101952
100rt 1 TcpCommand::Receive() 
    

1000000 TcpCommand::Receive() 
  

Core 1 runins 2000000
Answer 2000000
100p  1 TcpCommand::Receive() 
    

[STATS] Core 0, Joules 256573, Instructions 399939, Cycles 6261924, RefCycles 11135448
[STATS] Core 1, Joules 259420, Instructions 18095668, Cycles 48460968, RefCycles 46019448
[STATS] Core 2, Joules 262660, Instructions 2127, Cycles 1452859, RefCycles 1925064
[STATS] Core 3, Joules 265866, Instructions 2127, Cycles 1469353, RefCycles 1941192
[STATS] Core 4, Joules 268747, Instructions 2127, Cycles 1412782, RefCycles 1873920
[STATS] Core 5, Joules 271602, Instructions 2127, Cycles 1441749, RefCycles 1904184
[STATS] Core 6, Joules 274454, Instructions 2127, Cycles 1445676, RefCycles 1907016
[STATS] Core 7, Joules 277434, Instructions 2127, Cycles 1468162, RefCycles 1939296
[STATS] Core 8, Joules 221829, Instructions 2164, Cycles 53664, RefCycles 89712
[STATS] Core 9, Joules 224082, Instructions 2164, Cycles 53837, RefCycles 78576
[STATS] Core 10, Joules 226778, Instructions 8933, Cycles 91774, RefCycles 146496
[STATS] Core 11, Joules 229457, Instructions 2164, Cycles 69369, RefCycles 94368
[STATS] Core 12, Joules 232157, Instructions 2164, Cycles 66888, RefCycles 91248
[STATS] Core 13, Joules 234836, Instructions 2164, Cycles 73148, RefCycles 97104
[STATS] Core 14, Joules 237672, Instructions 2164, Cycles 79956, RefCycles 103680
[STATS] Core 15, Joules 240535, Instructions 9040, Cycles 117279, RefCycles 148056
100rt 1 TcpCommand::Receive() 
    

1300000 TcpCommand::Receive() 
   

Core 13 runins 2000000
Answer 2000000
100p  1 TcpCommand::Receive() 
    

[STATS] Core 0, Joules 256391, Instructions 399962, Cycles 6321716, RefCycles 11244504
[STATS] Core 1, Joules 259258, Instructions 82995, Cycles 25329975, RefCycles 24863304
[STATS] Core 2, Joules 262464, Instructions 2127, Cycles 1531734, RefCycles 2029512
[STATS] Core 3, Joules 265310, Instructions 2127, Cycles 1546857, RefCycles 2041080
[STATS] Core 4, Joules 268181, Instructions 2127, Cycles 1522004, RefCycles 2016096
[STATS] Core 5, Joules 271076, Instructions 2127, Cycles 1530131, RefCycles 2020872
[STATS] Core 6, Joules 273918, Instructions 8925, Cycles 1548494, RefCycles 2059032
[STATS] Core 7, Joules 277320, Instructions 9326, Cycles 1571729, RefCycles 2092680
[STATS] Core 8, Joules 222865, Instructions 2164, Cycles 42172, RefCycles 75816
[STATS] Core 9, Joules 225307, Instructions 2164, Cycles 44438, RefCycles 71664
[STATS] Core 10, Joules 227830, Instructions 2143, Cycles 52775, RefCycles 80712
[STATS] Core 11, Joules 230503, Instructions 2164, Cycles 60304, RefCycles 87792
[STATS] Core 12, Joules 232851, Instructions 2164, Cycles 58168, RefCycles 84624
[STATS] Core 13, Joules 235536, Instructions 18014152, Cycles 23532989, RefCycles 21840264
[STATS] Core 14, Joules 238714, Instructions 2164, Cycles 70160, RefCycles 96456
[STATS] Core 15, Joules 241572, Instructions 2143, Cycles 75910, RefCycles 101544
~~~
