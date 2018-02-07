#!/bin/bash

set -eo pipefail

VMID=$1

cpu_tasks() {
	expect <<EOF | sed -n 's/^.* CPU .*thread_id=\(.*\)$/\1/p' | tr -d '\r' || true
spawn qm monitor $VMID
expect ">"
send "info cpus\r"
expect ">"
EOF
}

VCPUS=($(cpu_tasks))
VCPU_COUNT="${#VCPUS[@]}"

if [[ $VCPU_COUNT -eq 0 ]]; then
	echo "* No VCPUS for VM$VMID"
	exit 1
fi

echo "* Detected ${#VCPUS[@]} assigned to VM$VMID..."
#echo "* Resetting cpu shield..."
echo $VCPUS

#for CPU_INDEX in "${!VCPUS[@]}"
#do
#	CPU_TASK="${VCPUS[$CPU_INDEX]}"
#	echo "* Assigning $CPU_INDEX to $CPU_TASK..."
#	taskset -pc "$CPU_INDEX" "$CPU_TASK"
#done
