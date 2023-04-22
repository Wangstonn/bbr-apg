#!/bin/bash

# Start Mininet-WiFi with a linear topology of two stations and one link
sudo mn --topo linear,2 --link tc,bw=10,delay=10ms,loss=1,jitter=5ms --mac --controller=none --client-isolation &

# Wait for Mininet-WiFi to start up
sleep 5

# Start an iperf server on sta1
xterm -e "mnexec -a sta1 iperf -s" &

# Wait for the server to start up
sleep 2

# Start an iperf client on sta2, sending a continuous stream of packets to sta1
xterm -e "mnexec -a sta2 iperf -c sta1 -t 3600 -i 1 > iperf_results.txt" &

# Wait for the client to start up
sleep 2

# Clean up
#sudo mn -c
