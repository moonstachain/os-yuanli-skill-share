---
name: os-yuanli
description: 按「治理OS × 工作OS」接管复杂任务的统一入口。先六判断，再走主题/策略/执行三层 gate，完成前验真，完成后留进化笔记。适用于多阶段、高价值、易漂移的任务。
---

# OS-原力

`os-yuanli` 是一个**可调用的根 skill**，用来把任务跑进「原力OS」协议。

它是一套**操作协议**，不是领域 skill，也不是文档索引。

默认顺序：

1. `六判断`
2. `主题层 gate`
3. `策略层 gate`
4. `执行层 route`
5. `验真`
6. `进化`

## Overview

当任务符合下面任一条件时，用本 skill 接管：

- 多阶段、跨工具、跨 skill
- 影响对外交付 / 品牌 / 金钱 / 信任
- 用户明确要求深度思考
- 容易跳步或漂移的策略/设计任务

不要从工具开始，不要从执行开始，不要从输出形式开始。

从以下三件事开始：

- 这件事值不值得进入
- 它该怎么赢
- 它该怎么被作为一个真实闭环收尾

然后按任务族适配产物包。

## Core Contract

对每个合格任务都必须应用：

1. `六判断先行`
   - `自治判断`
   - `全局最优判断`
   - `能力复用判断`
   - `验真判断`
   - `进化判断`
   - `当前最大失真`
2. `先主题，后策略，再执行`
   不跳过 `主题层` 和 `策略层` 直接进入执行。
3. `每层都过三条治理线`
   在每一层检查 `递归进化 / 全局最优 / 人类友好`。
4. `先止损，再推进`
   主题 gate 不过，停在 brief；策略弱，停在 card。
5. `完成前必须验真`
   真实核对 artifact 存在、满足目标、未偏离主题。
6. `完成后必须进化`
   以一段 `Evolution Note` 收尾。

详见 [references/constitution.md](references/constitution.md)。

## Universal Interface

每次输出都包含两层。

### Universal Preamble

显式给出：

- `六判断`
- `任务族判断`
- `mode 判断`（full / light）

### Adaptive Artifact Pack

按 [references/task-family-map.md](references/task-family-map.md) 映射任务族，采用对应产物包。

默认支持的族：

- `内容生产`
- `研究审计`
- `工作流自动化`
- `接线部署`
- `治理协作`
- `软件开发`
- `未知或混合任务`

`full mode`：多阶段、高价值、有权衡、或用户要求深入。
`light mode`：小、低风险、低复杂度。visible 输出可压缩，但三层 gate 不能省。

详见 [references/output-contract.md](references/output-contract.md)。

## Workflow

按顺序执行。

### 1. Shape The Task

把请求压缩成：

- 真实目标
- 完成条件
- 人类独占边界
- 明显约束

请求模糊时，先用一轮澄清问题拆决策；已经清晰则只做轻压缩。

### 2. Classify The Task Family

从 [references/task-family-map.md](references/task-family-map.md) 选最小有效族。

不要把任务留作「未分类」，除非它真的混合或仍模糊。

### 3. Choose The Mode

选 `full mode` 或 `light mode`。

多阶段、跨能力、实质重要 → 默认 `full mode`。

### 4. Run The Theme Gate

问：这件事值不值得进入？

输出任务族对应的 brief 对象。

出现以下情况时停在这一步：

- 任务不服务当前目标
- 目标太弱或太模糊
- 明显存在更高价值的主题

### 5. Run The Strategy Gate

问：这件事该怎么赢？

说明当前策略层次：

- `数据`
- `特征`
- `观点`
- `洞察`
- `全局最优`

输出任务族对应的 card 对象。

出现以下情况时停在执行前：

- 策略只是 slogan
- 证据路径弱
- 路线未解核心矛盾

### 6. Route The Execution Layer

选择最小可用执行集，由你的现有 skill / agent / 工具完成。

显式给出：

- 谁 / 什么来执行
- 为什么选这条路径
- 验真目标是什么

### 7. Verify Before Claiming Completion

声明完成前检查：

- artifact 真实存在
- 结果满足目标
- 没偏离主题和策略

### 8. End With Evolution

每轮都产出一条 `Evolution Note`。

若本轮暴露出可复用的能力升级，**显式列出**升级建议（是否采纳由使用者决定，不要自动泛化）。

## Task-Family Adaptation

按族适配产物包（全部定义见 `task-family-map.md`）。

| 任务族 | Brief | Card | Run Sheet | Pack |
| --- | --- | --- | --- | --- |
| 内容生产 | Theme Brief | Strategy Card | Execution Run Sheet | Publish Pack |
| 研究审计 | Inquiry Brief | Analysis Card | Audit Run Sheet | Audit Pack |
| 工作流自动化 | Automation Brief | Design Card | Build Run Sheet | Delivery Pack |
| 接线部署 | Rollout Brief | Rollout Card | Deployment Run Sheet | Release Pack |
| 治理协作 | Governance Brief | Policy Card | Governance Run Sheet | Decision Pack |
| 软件开发 | Dev Brief | Architecture Card | Dev Run Sheet | Delivery Pack |
| 未知/混合 | Task Brief | Strategy Card | Execution Run Sheet | Result Pack |

所有族都以 `Evolution Note` 收尾。

## Integration Boundaries

- 本 skill 只管**决策骨架**和**输出契约**，不绑定任何具体工具链。
- 执行层由使用者已有的 skill / agent / MCP 自行路由。
- 不要把本 skill 写成巨型 prompt：references 分片加载。

## Guardrails

- 不要把本 skill 变成巨型 prompt。
- 不要因为执行看起来容易就跳过主题 gate。
- 不要把一个好观点当作已完成的策略。
- 不要在 artifact 真实存在前声明完成。
- 不要暴露超过必要的人工检查点。
- 不要硬编码过多领域工作流。

## References

- [references/constitution.md](references/constitution.md): 压缩版宪法
- [references/task-family-map.md](references/task-family-map.md): 族识别、产物包、停止条件
- [references/output-contract.md](references/output-contract.md): full / light 输出规则
