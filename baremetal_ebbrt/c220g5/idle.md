## powersave
~~~
hand32@server2:~/cloudlab$ for((i=0;i<3;i++)); do perf stat -a -e power/energy-pkg/ -x, sleep 10; done
475.42,Joules,power/energy-pkg/,20005659301,100.00,,
476.35,Joules,power/energy-pkg/,20005694876,100.00,,
476.32,Joules,power/energy-pkg/,20005448729,100.00,,
~~~

## ondemand
~~~
not supported
~~~

## performance
~~~
hand32@server2:~/cloudlab$ for((i=0;i<3;i++)); do perf stat -a -e power/energy-pkg/ -x, sleep 10; done
475.09,Joules,power/energy-pkg/,20003968734,100.00,,
474.36,Joules,power/energy-pkg/,20002853608,100.00,,
476.31,Joules,power/energy-pkg/,20002821606,100.00,,
~~~