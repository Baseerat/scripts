#! /bin/sh -ve

DIR=~/Baseerat/ovs/utilities

$DIR/ovs-vsctl del-br br0

brctl addif vmbr1 tap110i1
