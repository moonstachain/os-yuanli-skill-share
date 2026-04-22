# Team Engineer Setup

**面向工程/技术同事的参考配置**——熟悉 Claude Code 与 GitHub，有自己的 repo，可能用 Notion 做协作。

## 这个示例演示

- **3 个主题**：产品开发 / 基建治理 / 客户交付
- **2 个 runtime**：claude-code（本地 Execute）+ codex（异步长跑）+ manual（升级兜底）
- **2 个桥**：本地文件（真源） + Notion（镜像做协作视图）
- **推荐 daemon**：阻塞告警 + 周五周报

## 适用场景

- 工程团队 2–10 人
- 任务真源在 git 里，但 leadership 想在 Notion/类似工具里看仪表盘
- 有长跑任务（大重构、CI pipeline）需要异步 runtime
- 重视合规：CI 必须跑 audit

## 直接使用

```bash
cp -r examples/team-engineer-setup/{themes,runtime,bridges}.yaml ./my-workspace/
# 根据实际情况修改 bridges.yaml 的 database_id 与 vault_path 等字段
bin/os-yuanli-audit --workspace ./my-workspace
```

## 关键决策说明

- **真源是 workspace**：任务 `.md` 在 git 里，Notion 只做镜像。防止"在 Notion 改完 git 里还没更新"。
- **codex 只承担长跑**：本地小改用 claude-code，避免远程 runtime 的同步开销。
- **manual 总是在场**：任何 runtime 卡住都能 `escalated` 到 manual。
