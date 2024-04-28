## Profiling loadonly

~~~
hand32@serverebbrt:~$ perf stat -a -e instructions,cycles,ref-cycles,power/energy-pkg/,cpu-clock -x, ~/memcached/memcached -u nobody -t 32 -m 82G -c 8192 -o hashpower=20 -b 8192 -l 192.168.1.20 -B binary -L
7303786493,,instructions,450266015517,100.00,0.31,insn per cycle
23663214967,,cycles,450266065684,100.00,0.053,GHz
27586073736,,ref-cycles,450266078681,100.00,61.266,M/sec
485.05,Joules,power/energy-pkg/,28141742128,100.00,1.077,/sec
450266.06,msec,cpu-clock,450266062879,100.00,32.000,CPUs utilized

hand32@serverebbrt:~$ perf stat -a -e instructions,cycles,ref-cycles,power/energy-pkg/,cpu-clock -x, ~/memcached/memcached -u nobody -t 32 -m 82G -c 8192 -o hashpower=20 -b 8192 -l 192.168.1.20 -B binary -L
7252344083,,instructions,450796753897,100.00,0.31,insn per cycle
23652940468,,cycles,450796720541,100.00,0.052,GHz
27844840104,,ref-cycles,450796718416,100.00,61.768,M/sec
475.98,Joules,power/energy-pkg/,28174892195,100.00,1.056,/sec
450796.67,msec,cpu-clock,450796671413,100.00,32.000,CPUs utilized

hand32@serverebbrt:~$ perf stat -a -e instructions,cycles,ref-cycles,power/energy-pkg/,cpu-clock -x, ~/memcached/memcached -u nobody -t 32 -m 82G -c 8192 -o hashpower=20 -b 8192 -l 192.168.1.20 -B binary -L
7234980000,,instructions,450215836077,100.00,0.31,insn per cycle
23567271552,,cycles,450215761829,100.00,0.052,GHz
27682943496,,ref-cycles,450215714547,100.00,61.488,M/sec
481.46,Joules,power/energy-pkg/,28138966099,100.00,1.069,/sec
450215.65,msec,cpu-clock,450215654710,100.00,32.001,CPUs utilized

~~~