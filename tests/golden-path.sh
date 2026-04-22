#!/usr/bin/env bash
# Golden-path 集成测试：clone → init → create task → audit
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
TMPDIR="$(mktemp -d)"
trap 'rm -rf "$TMPDIR"' EXIT

echo "── golden-path test ──"
echo "repo:      $REPO_ROOT"
echo "workspace: $TMPDIR"
echo

# 1. doctor · 在仓库本身跑一次
echo "▶ step 1: doctor on repo"
python3 "$REPO_ROOT/bin/os-yuanli-doctor"
echo

# 2. init · non-interactive 生成 smoke workspace
echo "▶ step 2: init workspace"
python3 "$REPO_ROOT/bin/os-yuanli-init" --workspace "$TMPDIR" --non-interactive
echo

# 3. audit · 空 workspace 应通过
echo "▶ step 3: audit empty workspace"
python3 "$REPO_ROOT/bin/os-yuanli-audit" --workspace "$TMPDIR"
echo

# 4. 创建一个合规任务
echo "▶ step 4: create a compliant task"
cat > "$TMPDIR/tasks/T-0001-smoke.md" <<'EOF'
---
title: "smoke test task"
type: task
theme: demo
status: pending
priority: P2
runtime: claude-code
created: 2026-04-22
---

## Done Condition
- golden-path 测试跑通

## Why
验证 CLI 链路

## How
1. init
2. create task
3. audit

## Evidence
（待填）

## Evolution
（待填）
EOF
python3 "$REPO_ROOT/bin/os-yuanli-audit" --workspace "$TMPDIR"
echo

# 5. 创建一个不合规任务，audit 应失败
echo "▶ step 5: create a non-compliant task, expect audit FAIL"
cat > "$TMPDIR/tasks/T-0002-bad.md" <<'EOF'
---
title: "bad task"
type: task
theme: nonexistent_theme
status: invalid_status
priority: P2
runtime: claude-code
created: 2026-04-22
---

## Done Condition
missing evolution section on purpose
EOF
if python3 "$REPO_ROOT/bin/os-yuanli-audit" --workspace "$TMPDIR"; then
    echo "❌ FAIL: bad task 应该被 audit 拒绝"
    exit 1
fi
echo "  ✅ audit 正确地拒绝了 bad task"
echo

echo "── golden-path PASS ──"
