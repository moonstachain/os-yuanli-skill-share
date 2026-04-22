---
title: "把 yuanli-os 萃取为同事可用的 skill"
type: task
theme: zhongtai
status: closed
priority: P1
runtime: claude-code
created: 2026-04-22
closed: 2026-04-22
outcome: "4 个 milestone 产出 kernel + protocols + templates + CLI + docs，v1.0 合入 main"
artifacts:
  - "https://github.com/moonstachain/os-yuanli-skill-share"
tags: [task, example, demo]
---

## Done Condition

- 同事 clone 仓库后 30 分钟内能从 init 到跑通第一个合规任务
- golden-path CI 绿
- 至少 3 份 examples 可作参考

## Why

降低团队采用原力 OS 的门槛，让方法骨架脱离 HAY 个人工具链的绑定。

## How

- M1 Tier-1 capability pack（8 份 protocol）
- M2 Tier-2 adapter templates（6 份模板）
- M3 Onboarding CLI + golden-path
- M4 examples + docs

## Evidence

- [x] 8 份 protocol 含 Inclusion/Exclusion
- [x] 6 份 template 反向引用对应 protocol 的 Exclusion
- [x] 3 个 CLI + golden-path 本地 PASS
- [x] 3 份 examples（minimal / team-engineer / hay）
- [x] 4 份 docs（quickstart / concepts / adapter-guide / faq）

## Evolution

- **gained**：验证了「方法骨架 vs 个人绑定层」这条切分线——不砍 HAY 个人主题就无法通用
- **wasted**：早期差点把六大主题直接塞进 kernel，会让产品带一身"HAY 味"
- **improve next**：下次推"个人系统 → 团队化"，直接套 Kernel / Capability / Adapter / Reference 四层萃取，跳过讨论
