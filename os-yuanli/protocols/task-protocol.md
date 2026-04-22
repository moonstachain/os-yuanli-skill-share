# Task Protocol

一个「任务」= 一个 `.md` 文件。

这份协议是 `os-yuanli` 对「任务」的契约，决定什么样的东西可以被视为 OS 可接管的任务单元，以及它在整个 lifecycle 中应该长什么样。

## 目的

- 让任何 runtime（Claude Code / Codex / 人工）都能读懂同一份任务
- 让状态变更可验真，不是"说完成就完成"
- 让回流与进化有抓手，不是任务做完就散了

## File Contract

每个任务是**一个独立文件**，建议存放在使用者选定的根目录下（例如 `tasks/`、`workspace/tasks/`、`notes/tasks/` 都可以）。

**本协议不绑定存储位置**。具体路径由使用者在 `templates/bridges.yaml` 中声明。

## Frontmatter

必填字段：

```yaml
---
title: "<一句话说清是什么任务>"
type: task
theme: "<使用者自定义的主题 id>"
status: "<status-machine 中的一个值>"
priority: "<P0|P1|P2|P3>"
runtime: "<执行 runtime 的 id，例如 claude-code / codex / manual>"
created: "<YYYY-MM-DD>"
---
```

可选字段：

```yaml
closed: "<YYYY-MM-DD>"            # 关闭日期
outcome: "<一句话总结产出>"        # 完成摘要
artifacts:                        # 产物路径或链接数组
  - "<path or url>"
tags: [task]
parent: "<上级任务 id>"            # 子任务可用
```

> `theme` 的**枚举值不由本协议定义**——它由使用者的 `themes.yaml` 决定。本协议只要求它存在且取值合法。

## Required Sections

任务正文至少包含这 5 段（命名固定，顺序固定）：

### Done Condition

- 这个任务何时算做完？
- 用什么证据验证？
- 如果不写可验证标准，任务就不能进入 `in_progress`。

### Why

- 这个任务服务的上层目标是什么？
- 如果没有清晰的 Why，任务应停在 `planning`，不能下沉。

### How

- 执行路径的里程碑，可以很短（3–5 点）。
- 不必穷举每一步，但必须够路由做出 skill/tool 选择。

### Evidence

- 自检清单，对齐 Done Condition。
- 完成前必须填写；未填等于未完成，不允许进入 `closed`。

### Evolution

- 本轮学到的可复用结论。
- 至少一句话，不允许空。

## Status Machine

```
planning ──→ pending ──→ in_progress ──→ completed ──→ closed
                              │              │
                              ▼              ▼
                           blocked        escalated
```

| 状态 | 进入条件 |
|---|---|
| `planning` | 刚创建，Why / Done Condition 未定 |
| `pending` | Why / Done Condition 定稿，等待执行 |
| `in_progress` | 被某个 runtime 接管，执行中 |
| `completed` | Done Condition 已满足，Evidence 填写完 |
| `closed` | Evolution 写完，认知沉淀完成 |
| `blocked` | 遇到依赖 / 权限阻塞 |
| `escalated` | 超出当前 runtime 能力或权限，需要人类或其它 runtime 介入 |

**关键不变量**：

- 没有 Evidence 不能 `completed`
- 没有 Evolution 不能 `closed`
- `blocked` 必须同步列出"在等什么"才算合法

## Inclusion

本协议规定的：

- 文件是任务的唯一真源（single source of truth）
- frontmatter 字段名与 status 枚举
- 5 个必需正文段落的存在与命名
- 状态跃迁的核心不变量

## Exclusion（使用者自由度）

本协议**不规定**：

- 任务存放在哪个目录
- `theme` 的合法枚举值
- `runtime` 的合法枚举值
- 是否使用 Dataview / 数据库 / 其他工具做聚合
- 是否有 UI / dashboard
- 具体 priority 如何分配
- 子任务如何拆解

这些由使用者在 `templates/` 与自己的 adapter 中决定。

## Minimum Viable Task

下面这份就是合法任务的最小形态，任何一个 OS 合规 runtime 都能接管：

```markdown
---
title: "给同事复用 os-yuanli 写一份 onboarding 文档"
type: task
theme: knowledge-ops
status: pending
priority: P2
runtime: claude-code
created: 2026-04-22
---

## Done Condition
- 新同事 30 分钟内能从 clone 到跑通第一个 task
- onboarding 文档通过一次真人走查

## Why
降低同事采用门槛，避免一对一口头讲解成本

## How
1. 写 quickstart.md
2. 找一位同事当白鼠
3. 按 feedback 迭代

## Evidence
（完成后填）

## Evolution
（完成后填）
```
