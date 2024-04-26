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
