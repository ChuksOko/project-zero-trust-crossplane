#!/bin/bash
# =============================================================================
# Zero Trust Micro-Segmentation — iptables Remediation Script
# =============================================================================
# Applied to router container acting as Transit Gateway
# Blocks all lateral movement between dev and prod networks
#
# Author: Chukwuemeka Oko
# Project: Project Zero-Trust Crossplane
# =============================================================================

echo "[*] Applying micro-segmentation rules to Transit Gateway..."

# Drop all forwarded traffic by default
iptables -P FORWARD DROP
echo "[+] FORWARD policy set to DROP — all cross-subnet traffic blocked"

# Allow only established/related connections
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
echo "[+] ESTABLISHED/RELATED connections permitted"

echo ""
echo "[*] Current iptables FORWARD chain:"
iptables -L FORWARD -n -v

echo ""
echo "[+] Micro-segmentation complete"
echo "[+] Lateral movement between dev_network and prod_network is now structurally impossible"
