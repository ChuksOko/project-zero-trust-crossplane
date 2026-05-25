# Project Zero-Trust Crossplane

## Internal Network Penetration Testing & Micro-Segmentation

**Analyst:** Chukwuemeka Oko
**Date:** May 2026
**Environment:** Local Docker Lab (Zero-cost infrastructure)

---

## Project Overview

This project demonstrates a complete offensive and defensive security engineering
lifecycle for internal network penetration testing and micro-segmentation.

**Phase 1 — Offensive:** Act as an internal adversary to test lateral movement
boundaries between a Development and Production network zone.

**Phase 2 — Defensive:** Apply micro-segmentation using iptables on a simulated
Transit Gateway to make lateral movement structurally impossible.

---

## Lab Architecture
---

## Repository Structure

---

## Quick Start

```bash
# Spin up the lab
docker compose up -d

# Wait 3 minutes for containers to initialise
sleep 180

# Verify all containers are ready
docker logs dev-node --tail 3
docker logs router --tail 3
docker logs prod-node --tail 3

# SSH into dev-node (attacker foothold)
ssh root@localhost -p 2222
# Password: weakpassword
```

---

## Key Findings

| Finding | Severity | Status |
|---------|----------|--------|
| Lateral movement from dev to prod possible | CRITICAL | Remediated |
| PostgreSQL accessible with default credentials | HIGH | Remediated |
| Customer SSN data exfiltrated from dev node | CRITICAL | Remediated |
| No network segmentation between zones | HIGH | Remediated |

---

## Remediation Applied

```bash
# Block all cross-subnet forwarding by default
iptables -P FORWARD DROP

# Allow only established/related connections
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
```

**Result:** Lateral movement between dev and prod networks is now
structurally impossible. Post-remediation validation confirms 100% packet
loss and connection timeout on all cross-subnet attempts.
