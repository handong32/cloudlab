import sys, os, time, argparse
import datetime

def runcmd(cmd):
    print('------------------------------------------------------------')
    print(cmd)
    res=os.popen(cmd).read()
    print(res)
    print('------------------------------------------------------------')

def getcmd(cmd):
    #print('------------------------------------------------------------')
    #print(cmd)
    res=os.popen(cmd).read()
    #print(res)
    #print('------------------------------------------------------------')
    return res

def getSocketJoules():
    socket0 = getcmd('cat /sys/class/hwmon/hwmon2/energy65_input')
    socket1 = getcmd('cat /sys/class/hwmon/hwmon2/energy66_input')
    return int(socket0)+int(socket1)

if __name__ == '__main__':
    startJ = getSocketJoules()
    time.sleep(2)
    endJ = getSocketJoules()

    print("diff:", (endJ-startJ)/(100000.0), " J")
