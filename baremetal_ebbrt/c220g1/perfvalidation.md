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
volatile unsigned int ans = 0;                                                                                                                                                                                                       
        volatile unsigned int i;                                                                                                                                                                                                             
        for(i=0;i<param;i++) {                                                                                                                                                                                                               
          ans += 1;                                                                                                                                                                                                                          
        }                                                                                                                                                                                                                                    
        ebbrt::kprintf_force("Answer %u\n", ans);
Core 3 runins 10000000
Answer 10000000
100p  1 TcpCommand::Receive() 
    

[STATS] Core 0, Rdtsc 2439668295, Joules 241135, Instructions 399638, Cycles 6614845, RefCycles 11404872
[STATS] Core 1, Rdtsc 2464269060, Joules 244602, Instructions 86609, Cycles 26075726, RefCycles 25256088
[STATS] Core 2, Rdtsc 2488863393, Joules 248188, Instructions 2130, Cycles 1787075, RefCycles 2362512
[STATS] Core 3, Rdtsc 2512769757, Joules 251775, Instructions 90015052, Cycles 86428999, RefCycles 80498760
[STATS] Core 4, Rdtsc 2538062868, Joules 255694, Instructions 2130, Cycles 1740312, RefCycles 2306472
[STATS] Core 5, Rdtsc 2561962836, Joules 258922, Instructions 2130, Cycles 1770273, RefCycles 2336688
[STATS] Core 6, Rdtsc 2585869020, Joules 262504, Instructions 2130, Cycles 1772022, RefCycles 2338560
[STATS] Core 7, Rdtsc 2609764821, Joules 266283, Instructions 2130, Cycles 1809880, RefCycles 2388840
[STATS] Core 8, Rdtsc 2633665488, Joules 225074, Instructions 2167, Cycles 50793, RefCycles 101448
[STATS] Core 9, Rdtsc 2656864226, Joules 228290, Instructions 9041, Cycles 82038, RefCycles 154896
[STATS] Core 10, Rdtsc 2680059645, Joules 231315, Instructions 2146, Cycles 61706, RefCycles 108216
[STATS] Core 11, Rdtsc 2703481486, Joules 234884, Instructions 2146, Cycles 67416, RefCycles 113208
[STATS] Core 12, Rdtsc 2726907775, Joules 238463, Instructions 2168, Cycles 72357, RefCycles 116112
[STATS] Core 13, Rdtsc 2750338851, Joules 242018, Instructions 2167, Cycles 77716, RefCycles 121896
[STATS] Core 14, Rdtsc 2773765167, Joules 245592, Instructions 2168, Cycles 86763, RefCycles 131424
[STATS] Core 15, Rdtsc 2797190721, Joules 248936, Instructions 9359, Cycles 119132, RefCycles 190080
100rt 1 TcpCommand::Receive() 
    

30000000 cpCommand::Receive() 
  

Core 3 runins 20000000
Answer 20000000
100p  1 TcpCommand::Receive() 
    

[STATS] Core 0, Rdtsc 2439166431, Joules 245345, Instructions 399311, Cycles 6533107, RefCycles 11192664
[STATS] Core 1, Rdtsc 2463767328, Joules 248824, Instructions 84594, Cycles 25959875, RefCycles 25112424
[STATS] Core 2, Rdtsc 2488365555, Joules 252318, Instructions 2130, Cycles 1717621, RefCycles 2276184
[STATS] Core 3, Rdtsc 2512270656, Joules 255881, Instructions 180015008, Cycles 154638000, RefCycles 143434776
[STATS] Core 4, Rdtsc 2538259653, Joules 259799, Instructions 2130, Cycles 1677947, RefCycles 2225496
[STATS] Core 5, Rdtsc 2562158748, Joules 263350, Instructions 2130, Cycles 1701919, RefCycles 2250984
[STATS] Core 6, Rdtsc 2586061131, Joules 266924, Instructions 2130, Cycles 1707118, RefCycles 2253840
[STATS] Core 7, Rdtsc 2609959722, Joules 270592, Instructions 2130, Cycles 1737243, RefCycles 2293680
[STATS] Core 8, Rdtsc 2633859760, Joules 229782, Instructions 2167, Cycles 89752, RefCycles 170712
[STATS] Core 9, Rdtsc 2657059415, Joules 232917, Instructions 2167, Cycles 93111, RefCycles 168576
[STATS] Core 10, Rdtsc 2680256678, Joules 236501, Instructions 2146, Cycles 101952, RefCycles 179880
[STATS] Core 11, Rdtsc 2703917110, Joules 240077, Instructions 2146, Cycles 108886, RefCycles 186288
[STATS] Core 12, Rdtsc 2727579420, Joules 243659, Instructions 11062, Cycles 152255, RefCycles 235032
[STATS] Core 13, Rdtsc 2751470454, Joules 247217, Instructions 2167, Cycles 116776, RefCycles 191376
[STATS] Core 14, Rdtsc 2775124868, Joules 251000, Instructions 9041, Cycles 148940, RefCycles 249240
[STATS] Core 15, Rdtsc 2798785530, Joules 254411, Instructions 2146, Cycles 130492, RefCycles 205992
100rt 1 TcpCommand::Receive() 
    

30000000 cpCommand::Receive() 
  

Core 3 runins 30000000
Answer 30000000
100p  1 TcpCommand::Receive() 
    

[STATS] Core 0, Rdtsc 2439529830, Joules 249107, Instructions 399440, Cycles 6428320, RefCycles 10910304
[STATS] Core 1, Rdtsc 2464132143, Joules 252864, Instructions 84286, Cycles 25604208, RefCycles 24945528
[STATS] Core 2, Rdtsc 2488728510, Joules 256447, Instructions 2130, Cycles 1582729, RefCycles 2096808
[STATS] Core 3, Rdtsc 2512633188, Joules 259997, Instructions 270015052, Cycles 224660731, RefCycles 208016232
[STATS] Core 4, Rdtsc 2538623103, Joules 263936, Instructions 2130, Cycles 1546554, RefCycles 2051448
[STATS] Core 5, Rdtsc 2562524004, Joules 267527, Instructions 2130, Cycles 1570805, RefCycles 2077248
[STATS] Core 6, Rdtsc 2586422490, Joules 271114, Instructions 2130, Cycles 1573204, RefCycles 2076288
[STATS] Core 7, Rdtsc 2610321801, Joules 274682, Instructions 2130, Cycles 1603948, RefCycles 2117232
[STATS] Core 8, Rdtsc 2634224736, Joules 236259, Instructions 2167, Cycles 108747, RefCycles 208416
[STATS] Core 9, Rdtsc 2657659180, Joules 239365, Instructions 2167, Cycles 109592, RefCycles 201576
[STATS] Core 10, Rdtsc 2681079974, Joules 242943, Instructions 8940, Cycles 148190, RefCycles 256248
[STATS] Core 11, Rdtsc 2704740100, Joules 246505, Instructions 2146, Cycles 126420, RefCycles 221472
[STATS] Core 12, Rdtsc 2728404047, Joules 250080, Instructions 2167, Cycles 126526, RefCycles 216912
[STATS] Core 13, Rdtsc 2752060568, Joules 253655, Instructions 2167, Cycles 133993, RefCycles 224952
[STATS] Core 14, Rdtsc 2775717511, Joules 257361, Instructions 2167, Cycles 141630, RefCycles 234696
[STATS] Core 15, Rdtsc 2799379491, Joules 260810, Instructions 8962, Cycles 173434, RefCycles 292056

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

## EbbRT PCM idle
~~~
Power units = 0.125W                                                                                                                                                                                                                         
CPU Energy units = 0.00006104J                                                                                                                                                                                                               
DRAM Energy units = 0.00006104J                                                                                                                                                                                                              
Time units = 0.00097656s    

echo "start,100" | socat - TCP4:192.168.1.9:5002 && sleep 10 && echo "stop,100" | socat - TCP4:192.168.1.9:5002
                                                                                                                                                                                                                                             
[STATS] Core 0, Joules 2630243, Instructions 4105502, Cycles 65748120, RefCycles 117320376                                                                                                                                                   
[STATS] Core 1, Joules 2633460, Instructions 50401, Cycles 26619547, RefCycles 30900696                                                                                                                                                      
[STATS] Core 2, Joules 2636696, Instructions 2127, Cycles 16185040, RefCycles 21455832                                                                                                                                                       
[STATS] Core 3, Joules 2639552, Instructions 2127, Cycles 16378729, RefCycles 21736992                                                                                                                                                       
[STATS] Core 4, Joules 2642778, Instructions 2127, Cycles 15313227, RefCycles 20457120                                                                                                                                                       
[STATS] Core 5, Joules 2645652, Instructions 2127, Cycles 15773308, RefCycles 20952048                                                                                                                                                       
[STATS] Core 6, Joules 2648979, Instructions 11635, Cycles 15822026, RefCycles 21012504                                                                                                                                                      
[STATS] Core 7, Joules 2652391, Instructions 2127, Cycles 16144488, RefCycles 21495360                                                                                                                                                       
[STATS] Core 8, Joules 2194500, Instructions 2164, Cycles 27965, RefCycles 55848                                                                                                                                                             
[STATS] Core 9, Joules 2197091, Instructions 2164, Cycles 31794, RefCycles 54600                                                                                                                                                             
[STATS] Core 10, Joules 2199449, Instructions 2143, Cycles 39604, RefCycles 62616                                                                                                                                                            
[STATS] Core 11, Joules 2202263, Instructions 2164, Cycles 45481, RefCycles 68784                                                                                                                                                            
[STATS] Core 12, Joules 2205479, Instructions 2164, Cycles 49643, RefCycles 71544                                                                                                                                                            
[STATS] Core 13, Joules 2208357, Instructions 2165, Cycles 51282, RefCycles 74544                                                                                                                                                            
[STATS] Core 14, Joules 2211213, Instructions 2164, Cycles 55475, RefCycles 77352                                                                                                                                                            
[STATS] Core 15, Joules 2214062, Instructions 2143, Cycles 62843, RefCycles 84168                                                                                                                                                            
100rt 1 TcpCommand::Receive()                                                                                                                                                                                                                

2630243 * 0.00006104 / 10. =>  16.055003272                                                                                                                                                                                                              
                                                                                                                                                                                                                                             
100p  1 TcpCommand::Receive()                                                                                                                                                                                                                
                                                                                                                                                                                                                                             
echo "start,100" | socat - TCP4:192.168.1.9:5002 && sleep 30 && echo "stop,100" | socat - TCP4:192.168.1.9:5002
                                                                                                                                         
[STATS] Core 0, Joules 7550644, Instructions 11910264, Cycles 189945501, RefCycles 339111744                                                                                                                                                 
[STATS] Core 1, Joules 7553876, Instructions 51322, Cycles 55434776, RefCycles 69355728                                                                                                                                                      
[STATS] Core 2, Joules 7557067, Instructions 2127, Cycles 46901522, RefCycles 62352528                                                                                                                                                       
[STATS] Core 3, Joules 7559933, Instructions 2127, Cycles 47163694, RefCycles 62542848                                                                                                                                                       
[STATS] Core 4, Joules 7563160, Instructions 2127, Cycles 46275634, RefCycles 61666824                                                                                                                                                       
[STATS] Core 5, Joules 7566031, Instructions 2127, Cycles 46246633, RefCycles 61557648                                                                                                                                                       
[STATS] Core 6, Joules 7568888, Instructions 2127, Cycles 45930394, RefCycles 61197552                                                                                                                                                       
[STATS] Core 7, Joules 7572134, Instructions 2127, Cycles 46564971, RefCycles 62042472                                                                                                                                                       
[STATS] Core 8, Joules 6402318, Instructions 2164, Cycles 27301, RefCycles  54528                                                                                                                                                             
[STATS] Core 9, Joules 6404929, Instructions 9038, Cycles 65018, RefCycles 114312                                                                                                                                                            
[STATS] Core 10, Joules 6407662, Instructions 2143, Cycles 46054, RefCycles 68520                                                                                                                                                            
[STATS] Core 11, Joules 6410521, Instructions 2164, Cycles 52163, RefCycles 74760                                                                                                                                                            
[STATS] Core 12, Joules 6413385, Instructions 2164, Cycles 55704, RefCycles 77280                                                                                                                                                            
[STATS] Core 13, Joules 6416257, Instructions 2164, Cycles 56115, RefCycles 77736                                                                                                                                                            
[STATS] Core 14, Joules 6419125, Instructions 2164, Cycles 63255, RefCycles 84552                                                                                                                                                            
[STATS] Core 15, Joules 6421979, Instructions 2164, Cycles 68840, RefCycles 89832
7550644*0.00006104/30.0 => 15.3630436587
~~~

## EbbRT RDTSC Validation
~~~
echo "start,100" | socat - TCP4:192.168.1.9:5002 && sleep 10 && echo "stop,100" | socat - TCP4:192.168.1.9:5002

[STATS] Core 0, Rdtsc 25168876347, Joules 2606358, Instructions 4107325, Cycles 65910571, RefCycles 117397560
[STATS] Core 1, Rdtsc 25194635379, Joules 2609921, Instructions 53744, Cycles 26597004, RefCycles 31221216
[STATS] Core 2, Rdtsc 25219696755, Joules 2613517, Instructions 2130, Cycles 16578956, RefCycles 22031040
[STATS] Core 3, Rdtsc 25244528151, Joules 2617090, Instructions 2130, Cycles 16679442, RefCycles 22107768
[STATS] Core 4, Rdtsc 25269356427, Joules 2621016, Instructions 2130, Cycles 16367519, RefCycles 21801456
[STATS] Core 5, Rdtsc 25294185573, Joules 2624670, Instructions 2130, Cycles 16362088, RefCycles 21766392
[STATS] Core 6, Rdtsc 25319013066, Joules 2628347, Instructions 2130, Cycles 16251826, RefCycles 21637704
[STATS] Core 7, Rdtsc 25343842761, Joules 2632529, Instructions 2130, Cycles 16481577, RefCycles 21942552
[STATS] Core 8, Rdtsc 25368671712, Joules 1929455, Instructions 9107, Cycles 65291, RefCycles 130368
[STATS] Core 9, Rdtsc 25392337340, Joules 1932542, Instructions 2146, Cycles 39841, RefCycles 70704
[STATS] Core 10, Rdtsc 25415762738, Joules 1935484, Instructions 2208, Cycles 47316, RefCycles 79536
[STATS] Core 11, Rdtsc 25439422922, Joules 1938783, Instructions 2229, Cycles 53521, RefCycles 85080
[STATS] Core 12, Rdtsc 25463077162, Joules 1942174, Instructions 2208, Cycles 57438, RefCycles 88032
[STATS] Core 13, Rdtsc 25486730003, Joules 1945194, Instructions 2229, Cycles 64456, RefCycles 95016
[STATS] Core 14, Rdtsc 25510389606, Joules 1948775, Instructions 2167, Cycles 70259, RefCycles 100608
[STATS] Core 15, Rdtsc 25534283567, Joules 1952335, Instructions 2270, Cycles 76215, RefCycles 106128
100rt 1 TcpCommand::Receive() 
    

100p  1 TcpCommand::Receive() 
    
echo "start,100" | socat - TCP4:192.168.1.9:5002 && sleep 30 && echo "stop,100" | socat - TCP4:192.168.1.9:5002

[STATS] Core 0, Rdtsc 73052185245, Joules 7377846, Instructions 11907756, Cycles 189068659, RefCycles 338319984
[STATS] Core 1, Rdtsc 73078417308, Joules 7381789, Instructions 36694, Cycles 54062270, RefCycles 68062296
Allocated fffffffeee6fc000 - fffffffeeeefbfff
[STATS] Core 2, Rdtsc 73114387893, Joules 7387160, Instructions 2130, Cycles 45970520, RefCycles 61107744
[STATS] Core 3, Rdtsc 73139218695, Joules 7390718, Instructions 15099, Cycles 46260406, RefCycles 61355208
[STATS] Core 4, Rdtsc 73164281949, Joules 7394771, Instructions 2130, Cycles 45356841, RefCycles 60432552
[STATS] Core 5, Rdtsc 73189111383, Joules 7398416, Instructions 1149, Cycles 45323305, RefCycles 60324144
[STATS] Core 6, Rdtsc 3213630791979, Joules 51237526, Instructions 70093, Cycles 129514731, RefCycles 150671424
[STATS] Core 7, Rdtsc 3213632192823, Joules 51237517, Instructions 77099, Cycles 130576793, RefCycles 152104800
[STATS] Core 8, Rdtsc 3213633601928, Joules 35556577, Instructions 74076, Cycles 51004229, RefCycles 48115560
[STATS] Core 9, Rdtsc 3213635713306, Joules 35556772, Instructions 66116, Cycles 50990143, RefCycles 47282136
[STATS] Core 10, Rdtsc 3213638090236, Joules 35557521, Instructions 66629, Cycles 51509152, RefCycles 47766168
[STATS] Core 11, Rdtsc 3213640389757, Joules 35558146, Instructions 66893, Cycles 51768834, RefCycles 48005688
[STATS] Core 12, Rdtsc 3213642735542, Joules 35558703, Instructions 66882, Cycles 51743183, RefCycles 47977488
[STATS] Core 13, Rdtsc 3213645086611, Joules 35559611, Instructions 67074, Cycles 51763658, RefCycles 47998656
[STATS] Core 14, Rdtsc 3213647424612, Joules 35559607, Instructions 67204, Cycles 52018959, RefCycles 48236880
[STATS] Core 15, Rdtsc 3213649527316, Joules 35560195, Instructions 74020, Cycles 52045940, RefCycles 48288312
~~~
