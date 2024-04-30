## powersave
~~~
hand32@serverebbrt:~/cloudlab$ for((i=0;i<3;i++)); do perf stat -a -e power/energy-pkg/ -x, sleep 10; done
120.40,Joules,power/energy-pkg/,20003876230,100.00,,
120.12,Joules,power/energy-pkg/,20003850411,100.00,,
119.70,Joules,power/energy-pkg/,20004022668,100.00,,
~~~

## ondemand
~~~
hand32@serverebbrt:~/cloudlab$ for((i=0;i<3;i++)); do perf stat -a -e power/energy-pkg/ -x, sleep 10; done
118.41,Joules,power/energy-pkg/,20003893290,100.00,,
116.98,Joules,power/energy-pkg/,20003616488,100.00,,
118.17,Joules,power/energy-pkg/,20004070293,100.00,,
~~~

## performance
~~~
hand32@serverebbrt:~/cloudlab$ for((i=0;i<3;i++)); do perf stat -a -e power/energy-pkg/ -x, sleep 10; done
118.91,Joules,power/energy-pkg/,20002236651,100.00,,
118.55,Joules,power/energy-pkg/,20002237818,100.00,,
119.22,Joules,power/energy-pkg/,20002144309,100.00,,
~~~