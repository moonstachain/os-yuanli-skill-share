# Adapter Guide · 把协议接到你的世界

面向已经理解 Kernel / Capability 的使用者。目标：教你怎么把 Tier 2 模板填到自己的环境。

## 心智模型

```
protocols/ 说"规则是什么"
templates/ 说"你需要声明什么"
examples/  说"别人是怎么声明的"
```

填 adapter = **看一份 example** + **读对应 protocol 的 Exclusion 段** + **改成自己的**。

---

## 1. themes.yaml · 定义你的战场

### 基本原则

- 3–7 个主题。少了过度聚合，多了分散。
- 每个主题必须服务一个更大的目标（填在 `purpose` 字段）。
- 区分 `business`（直接产出价值）和 `enabling`（修路、基建）。

### 抄谁不抄谁

| 情况 | 抄 |
|---|---|
| 工程团队，产品为主 | `team-engineer-setup` |
| 单人多线 + 重知识资产 | `hay-setup`（**只看结构，别抄主题名**） |
| 小而快，刚起步 | `minimal-setup` |

### 反模式

- 直接抄 HAY 的 quant/macro/chuangye/liuliang/zhiku/zhongtai → 这是 HAY 的个人战场
- 叫 "其他"、"杂项" → 变成垃圾桶，丧失聚焦

### 怎么知道分得够不够

- 做了两周任务后跑 `os-yuanli-audit`，看看主题分布
- 如果某个主题 2 周内零 `completed`，考虑合并或下线
- 如果某个主题任务堆到 > 10，考虑拆分

---

## 2. runtime.yaml · 声明你的执行环境

### 必须声明的字段

```yaml
id:         # 机器标识
label:      # 人类可读
mode:       # local_sync | async_remote | manual
brain_tier: # A | B | C
cost_class: # low | medium | high
```

### 常见组合

| 你的工作方式 | 推荐 runtime 组合 |
|---|---|
| Claude Code 为主，偶尔人工 | claude-code (B) + manual (A) |
| 有长跑任务（大重构、CI pipeline） | 上加 codex (B, async) |
| 知识资产重，大量 lint / 去重 | 再上加 haiku-batch (C) |
| 全 manual / 学习阶段 | 只配 manual (A)，走"不用 AI"路线 |

### escalation 怎么配

```yaml
escalation:
  on_b_repeat_failure: manual         # B 连续两次低质量 → 升级到谁
  on_task_simpler_than_expected: haiku-batch  # 发现任务是 C 级 → 降级到谁
```

没配 escalation 也能跑，但 AI 反复在一个 tier 犯错时没有出口。

---

## 3. bridges.yaml · 接外部系统

### 关键决策：谁是真源

```yaml
truth_source: workspace | external | mirror
```

- `workspace`：git 仓库里的 `.md` 是真源，外部只是视图
- `external`：外部系统是真源，本地做镜像
- `mirror`：双向同步，**必须**配定时 diff 告警

**推荐默认 `workspace`**。这让 AI 可以安全地生成/修改任务而不担心覆盖外部编辑。

### 常见桥

| 外部系统 | kind | 用于 |
|---|---|---|
| Obsidian | obsidian | 个人阅读视图 / Dataview 聚合 |
| Notion | notion | 团队协作、leadership 看板 |
| 飞书/Airtable | tables_generic | 跨团队协作、客户可见的任务单 |
| Linear/Jira | project_mgmt_generic | 工程团队的工单系统 |

### 反模式

- 两个桥都声明 `truth_source: workspace` → 不算冲突
- 两个桥都声明 `truth_source: external` → **严重冲突**，改一个为 mirror 或禁用
- mirror 模式不配 diff 告警 → 会悄悄发生双源漂移

---

## 4. cockpit · 仪表盘

不是必须。如果任务数 < 20，用 `audit` + `ls` 足够。

任务数 > 20 时选一个变体：

- **Pure Markdown**：每周手写或脚本生成，最小依赖
- **Obsidian Dataview**：已经用 OB 的话成本最低
- **Notion/表格视图**：团队协作首选

三种都在 `os-yuanli/templates/cockpit.template.md` 有示例。

---

## 5. daemon.yaml · 可选

最小 setup **不需要** daemon。只有这些场景才考虑：

- 阻塞任务需要定时告警（`blocked_alert`）
- 有定期要拉的外部数据（股价、客户数据、日志）
- 团队需要定期周报 / 月报
- 需要定期做 skill / workflow 审计

### 建议的最小 daemon

即使只启用一条，也建议是 `blocked_alert`——它的收益最明显。

---

## 6. task.template.md · 任务的单文件标准

拷贝 `os-yuanli/templates/task.template.md` 到你的 tasks 目录即可使用。

### 一定要填的 4 件事

1. `theme`：必须在 themes.yaml 声明中
2. `runtime`：必须在 runtime.yaml 声明中
3. `## Done Condition`：可验证的完成标准
4. `## Why`：为什么要做

剩下的在执行过程中逐步补。

### closed 前必填

- `## Evidence`：对齐 Done Condition 的证据
- `## Evolution`：至少一句话

**audit 会拦你**——别想绕过。

---

## 验证你的 adapter 是否合格

```bash
python3 bin/os-yuanli-audit --workspace ~/my-os-workspace
```

看到 `✅ 全部通过` = 合规。

任何失败提示都会直接指向具体文件和字段。

## 当你想加新字段

不要改 protocol！改 template。

每个 protocol 的 `## Exclusion` 段就是"你可以自由扩展的地方"。

如果你发现你的字段**应该被所有人继承**（不是个人偏好），考虑发 PR 到 upstream，把它提升成 protocol 规则。
