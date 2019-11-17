set ns [ new Simulator ]
set tf [ open lab4.tr w ]
$ns trace-all $tf
set nf [ open lab4.nam w ]
$ns namtrace-all $nf

set n0 [ $ns node ]
set n1 [ $ns node ]
set n2 [ $ns node ]
set n3 [ $ns node ]
set n4 [ $ns node ]
set n5 [ $ns node ]
set n6 [ $ns node ] 

$n0 label "ping0"
$n2 label "Router"
$n4 label "ping4"
$n5 label "ping5"
$n6 label "ping6"
$ns color 1 "red"
$ns color 2 "blue"

$ns duplex-link $n0 $n2 100Mb 300ms DropTail
$ns duplex-link $n2 $n6 1Mb 300ms DropTail
$ns duplex-link $n5 $n2 100Mb 300ms DropTail
$ns duplex-link $n2 $n4 1Mb 300ms DropTail
$ns duplex-link $n3 $n2 1Mb 300ms DropTail
$ns duplex-link $n1 $n2 1Mb 300ms DropTail

$ns queue-limit $n0 $n2 5
$ns queue-limit $n2 $n6 2
$ns queue-limit $n2 $n4 3 
$ns queue-limit $n5 $n2 5

set Ping0 [ new Agent/Ping ]
$ns attach-agent $n0 $Ping0
set Ping4 [ new Agent/Ping ]
$ns attach-agent $n4 $Ping4
set Ping5 [ new Agent/Ping ]
$ns attach-agent $n5 $Ping5
set Ping6 [ new Agent/Ping ]
$ns attach-agent $n6 $Ping6

$Ping0 set packetSize_ 50000
$Ping0 set interval_ 0.0001
$Ping5 set packetSize_ 5000
$Ping5 set interval_ 0.0001
$Ping0 set class_ 1
$Ping5 set class_ 2

$ns connect $Ping0 $Ping4
$ns connect $Ping5 $Ping6

Agent/Ping instproc recv {from rtt} {
$self instvar node_
puts "The node [ $node_ id ] received a reply from $from with the round trip time of $rtt"
}
$ns at 0.1 " $Ping0 send "
$ns at 0.2 " $Ping0 send "
$ns at 0.3 " $Ping0 send "
$ns at 0.4 " $Ping0 send "
$ns at 0.5 " $Ping0 send "
$ns at 0.6 " $Ping0 send "
$ns at 0.7 " $Ping0 send "
$ns at 0.8 " $Ping0 send "
$ns at 0.9 " $Ping0 send "
$ns at 1.0 " $Ping0 send "
$ns at 1.1 " $Ping0 send "
$ns at 1.2 " $Ping0 send "
$ns at 1.3 " $Ping0 send "
$ns at 1.4 " $Ping0 send "
$ns at 1.5 " $Ping0 send "
$ns at 1.6 " $Ping0 send "
$ns at 1.7 " $Ping0 send "
$ns at 1.8 " $Ping0 send "
$ns at 1.9 " $Ping0 send "

$ns at 0.1 " $Ping5 send "
$ns at 0.2 " $Ping5 send "
$ns at 0.3 " $Ping5 send "
$ns at 0.4 " $Ping5 send "
$ns at 0.5 " $Ping5 send "
$ns at 0.6 " $Ping5 send "
$ns at 0.7 " $Ping5 send "
$ns at 0.8 " $Ping5 send "
$ns at 0.9 " $Ping5 send "
$ns at 1.0 " $Ping5 send "
$ns at 1.1 " $Ping5 send "
$ns at 1.2 " $Ping5 send "
$ns at 1.3 " $Ping5 send "
$ns at 1.4 " $Ping5 send "
$ns at 1.5 " $Ping5 send "
$ns at 1.6 " $Ping5 send "
$ns at 1.7 " $Ping5 send "
$ns at 1.8 " $Ping5 send "
$ns at 1.9 " $Ping5 send "                                           

proc finish {} {
  global ns nf tf
  exec nam lab4.nam &
  $ns flush-trace
  close $tf
  close $nf
  exit 0
}
$ns at 5.0 "finish"
$ns run




