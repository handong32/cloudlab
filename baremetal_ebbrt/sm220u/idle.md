## powersave
~~~
hand32@server3:~/cloudlab$ for((i=0;i<3;i++)); do perf stat -a -e power/energy-pkg/ -x, sleep 10; done
893.33,Joules,power/energy-pkg/,20005559241,100.00,,
892.02,Joules,power/energy-pkg/,20005343388,100.00,,
892.66,Joules,power/energy-pkg/,20005319928,100.00,,
~~~

## ondemand
~~~
hand32@server3:~/cloudlab$ for((i=0;i<3;i++)); do perf stat -a -e power/energy-pkg/ -x, sleep 10; done
955.95,Joules,power/energy-pkg/,20005191333,100.00,,
891.35,Joules,power/energy-pkg/,20005610011,100.00,,
891.10,Joules,power/energy-pkg/,20005638195,100.00,,
~~~

## performance
~~~
hand32@server3:~/cloudlab$ for((i=0;i<3;i++)); do perf stat -a -e power/energy-pkg/ -x, sleep 10; done
1482.69,Joules,power/energy-pkg/,20002548581,100.00,,
1479.44,Joules,power/energy-pkg/,20001835392,100.00,,
1477.48,Joules,power/energy-pkg/,20001843954,100.00,,
~~~