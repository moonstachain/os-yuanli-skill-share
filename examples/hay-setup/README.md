# HAY Setup · 作者个人实例

> ⚠️ **这不是一份"推荐配置"**。
>
> 这是本项目作者（HAY）自己在用的实例化，放在这里只为演示"Tier 2 模板能装多丰富的内容"。
>
> **不要直接复制**。你的战场不是 HAY 的战场，你的工具链不是 HAY 的工具链。
> 请从 `examples/minimal-setup/` 或 `examples/team-engineer-setup/` 开始，按自己的情况改。

## 这个实例的特点

- **6 个主题**：4 个业务战场 + 2 个使能战场（量化 / 宏观 / 创业 / 流量 / 智库 / 中台）
- **3 个 runtime**：claude-code + codex + manual，外加 C-tier 机械查询
- **3 条桥**：Obsidian Vault（阅读视图）+ 飞书多维表（协作视图）+ 本地文件（真源）
- **完整 daemon**：每日阻塞告警 / 每周净值拉取 / 每周五周报 / 每月 skill 审计

## 为什么会变成这个样子

1. HAY 是单人多线作战（量化投研 + 创业咨询 + 内容 IP 同时在跑）
2. 知识资产重，早早上了 Obsidian Vault
3. 与外部客户 / 读者协作多，飞书无法避免
4. 个人时间稀缺，大量 daemon 替代人工巡检

**你如果没有这些约束，模仿只会造成过度工程。**

## 读这个实例的正确方式

- 看 `themes.yaml`：感受"业务战场"和"使能战场"的划分方式，但**不要抄主题名**
- 看 `runtime.yaml`：感受多 runtime + 成本分级的组合逻辑
- 看 `bridges.yaml`：感受 workspace 为真源 + 多桥并存时怎么避免双源漂移
- 看 `tasks/` 里的样例：感受合规任务 `.md` 长什么样

## 什么不包含

- 作者的真实任务（隐私）
- 飞书 / OB 的具体凭证（永远不要提交到 git）
- 作者的个人仪表盘具体实现（参见 `os-yuanli/templates/cockpit.template.md` 的 Variant B/C）
