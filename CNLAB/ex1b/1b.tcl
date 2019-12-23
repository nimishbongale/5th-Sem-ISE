# Question: Simulate three nodes point-to-point networks with duplex links between them.
# Set the queue size and vary the bandwidth and find the number of packets dropped

set ns [new Simulator]
# adding and linking trace file
set tr [open 1b.tr w]
$ns trace-all $tr
# adding and linking nam file
set nf [ open 1b.nam w]
$ns namtrace-all $nf

# procedure to execute when code completes executing
proc finish {} {
    global ns tr nf
    $ns flush-trace
    close $tr
    close $nf
    exec awk -f 1b.awk 1b.tr &
    exec nam 1b.nam &
    exit 0
}

# Setting up 3 nodes

set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]

# Creating duplex links between them
$ns duplex-link $n0 $n1 1Mb 20ms DropTail
$ns duplex-link $n1 $n2 512Kb 20ms DropTail
# Setting queue limit
$ns queue-limit $n1 $n2 5

# Creating a UDP agent at n0
set udp0 [new Agent/UDP]
$ns attach-agent $n0 $udp0

# Creating an application that uses udp0 to generate traffic
set cbr0 [new Application/Traffic/CBR]
$cbr0 set packetSize_ 500
$cbr0 set interval_ 0.005
$cbr0 attach-agent $udp0

# Setting up a sink that acts as a destination
set sink [new Agent/Null]
$ns attach-agent $n2 $sink
$ns connect $udp0 $sink
# This line tells that udp0 is associated to sink and that the traffic should end at sink

$ns at 0.2 "$cbr0 start"
$ns at 4.5 "$cbr0 stop"
$ns at 5.0 "finish"
$ns run