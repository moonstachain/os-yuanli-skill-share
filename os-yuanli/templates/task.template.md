---
# ============================================================================
# 任务文件模板
# 实例化协议：protocols/task-protocol.md
# 请根据该协议的 frontmatter + Required Sections 契约填写。
# ============================================================================

title: "<一句话说清是什么任务>"
type: task

# theme 必须是 themes.yaml 中定义的 id
theme: "<从 themes.yaml 中选一个>"

# status 必须是 status machine 中的合法值：
# planning | pending | in_progress | completed | closed | blocked | escalated
status: planning

# priority: P0 | P1 | P2 | P3
priority: P2

# runtime 必须是 runtime.yaml 中定义的 id
runtime: "<从 runtime.yaml 中选一个>"

created: "<YYYY-MM-DD>"

# --- 可选字段 ---
# closed: "<YYYY-MM-DD>"
# outcome: "<一句话总结产出>"
# artifacts:
#   - "<path or url>"
# parent: "<上级任务 id>"
# tags: [task]
---

## Done Condition

<!--
必填。写不出可验证标准就别进入 in_progress。
示例：
- 8 份 protocol 文件全部存在于 os-yuanli/protocols/
- 每份 protocol 都带 Inclusion / Exclusion 段
- PR 通过 CI 并合入 main
-->

## Why

<!--
必填。这个任务服务的上层目标是什么？
示例：
让同事能按协议复用 os-yuanli，降低一对一口头传授成本。
-->

## How

<!--
必填。执行路径里程碑，3–5 点即可。
示例：
1. 按 ROADMAP M1 清单写 8 份 protocol
2. 更新 SKILL.md 注册
3. 推分支 + 发 PR
-->

## Evidence

<!--
完成前填写。对齐 Done Condition 的自检清单。
未填等于未完成，不允许进入 closed。
示例：
- [x] 8 份文件存在
- [x] 每份带 Inclusion / Exclusion
- [x] PR merged: https://github.com/...
-->

## Evolution

<!--
闭环前填写。至少一句话。
三段式建议：
- what was gained：
- what was wasted：
- what should improve next：
-->
