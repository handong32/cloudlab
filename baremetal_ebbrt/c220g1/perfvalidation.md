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
read_msr: 0x38d
read_msr: 0x30b
read_msr: 0x38d
read_msr: 0xc1
Start pwrite: perf_global_ctrl=0x100000000 kIa32PerfGlobalCtrlMsr=0x38f
Start pwrite: perf_global_ctrl=0x500000000 kIa32PerfGlobalCtrlMsr=0x38f
Start pwrite: perf_global_ctrl=0x500000001 kIa32PerfGlobalCtrlMsr=0x38f
Stop pwrite: perf_global_ctrl=0x400000001 kIa32PerfGlobalCtrlMsr=0x38f
Stop pwrite: perf_global_ctrl=0x1 kIa32PerfGlobalCtrlMsr=0x38f
Stop pwrite: perf_global_ctrl=0x0 kIa32PerfGlobalCtrlMsr=0x38f
read_msr: 0x309
read_msr: 0x30b
read_msr: 0xc1
ans: 100000, INS: 546753, REF_CYC: 1288584, LLC: 0
read_msr: 0x38d
read_msr: 0x38d
read_msr: 0x38d

~~~
