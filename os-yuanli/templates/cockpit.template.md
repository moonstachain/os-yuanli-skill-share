# 指挥中心 · Personal Cockpit

> 这是一个**可选** dashboard 模板，用来一屏看全局。
> 本模板提供 3 种变体，按你的工具链挑一个或混用。
>
> 实例化协议：`protocols/task-protocol.md`（读 status / theme / artifacts）
> 对应 ROADMAP：M2 · v0.3 · Adapter Templates

---

## Variant A · Pure Markdown（无依赖）

适用：workspace 是纯文件、不想装任何工具。

每周手写 / 脚本生成一次：

```markdown
# Cockpit · 2026-W17

## 本周完成
- [x] [写 onboarding 文档](tasks/knowledge_ops/T-0042-onboarding.md)
- [x] [修复路由 bug](tasks/platform/T-0041-router-fix.md)

## 进行中
- [ ] [季度复盘](tasks/customer_delivery/T-0043-q2-review.md) · P1 · in_progress

## 阻塞
- 🚨 [接 Notion 桥](tasks/platform/T-0039-notion.md) · blocked 5 天
  等待：Notion API 凭证审批

## 主题分布
- customer_delivery · 4 in_progress · 2 blocked
- knowledge_ops    · 3 in_progress
- platform         · 2 in_progress · 1 blocked
```

**生成方式**：
- 手写（低成本、低自动化）
- `os-yuanli-audit`（M3 交付）扫 `workspace.root` 自动生成

---

## Variant B · Obsidian Dataview

适用：bridges.yaml 启用了 obsidian 桥。

```dataview
TABLE theme AS "主题", status AS "状态", priority AS "优先级", outcome AS "结果"
FROM "tasks"
WHERE type = "task" AND status != "closed"
SORT theme ASC, priority ASC
```

```dataview
LIST
FROM "tasks"
WHERE type = "task" AND closed >= date(today) - dur(7d)
SORT closed DESC
```

```dataview
TABLE title AS "阻塞任务", (date(today) - date(created)) AS "阻塞天数"
FROM "tasks"
WHERE status = "blocked"
SORT (date(today) - date(created)) DESC
```

**注意**：Dataview 绑定 Obsidian。如果你不用 OB，请用 Variant A 或 C。

---

## Variant C · Notion / 表格工具

适用：bridges.yaml 启用了 notion / tables 桥，真源是 workspace（镜像到外部做视图）。

这种情况下 cockpit 是**外部系统里的视图**，而不是 .md 文件。

本仓库只保留一份**视图定义备忘**：

```yaml
cockpit_views:
  - name: 本周完成
    filter:
      closed: ">= 7d ago"
    sort:
      - closed desc
  - name: 阻塞告警
    filter:
      status: blocked
    sort:
      - aging_days desc
  - name: 主题分布
    group_by: theme
    agg:
      - count
      - by_status
```

当你换工具（Notion → Airtable → Linear）时，只需要重建这些视图，不必改任务文件本身。

---

## 告警线（通用）

无论哪个 variant，下列状态都应该在 cockpit 上**醒目显示**：

- `blocked` 超过 3 天
- 任一主题连续 2 周无 `completed` 任务
- 任一 runtime 的平均 SLA 超过其声明值的 1.5×

告警实现对齐 `protocols/guides-and-sensors.md` 的 Sensors 清单。

---

## Inclusion

- 3 个变体均能可视化任务 status / theme / priority / 阻塞
- 均能展示"本周完成"、"阻塞告警"

## Exclusion

本模板不规定：

- 具体刷新频率
- 是否做历史趋势
- 告警推送到哪里（见 `bridges.yaml`）
