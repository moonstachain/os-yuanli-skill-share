# OS-原力 · 精简内核版

一套可迁移的「治理 OS × 工作 OS」方法论 skill。

面向 Claude Code / Codex 两种运行时，同事拿到后 30 秒内可用。

## 是什么

`os-yuanli` 不是某个领域的工具，而是一个**接管复杂任务的协议**：

- `六判断` 先行
- `主题层 → 策略层 → 执行层` 三层 gate
- 完成前`验真`，完成后留一条`进化笔记`

它不替代你已有的 skill / agent / 工具链，而是在它们之上加一层**决策骨架**，让复杂任务不跳步、不漂移、不假完成。

## 快速开始（v0.4+）

```bash
git clone https://github.com/moonstachain/os-yuanli-skill-share.git
cd os-yuanli-skill-share
pip install -r requirements.txt   # 可选：pyyaml
bin/os-yuanli-doctor              # 环境检查
bin/os-yuanli-init --workspace ./my-workspace  # 交互式向导
bin/os-yuanli-audit --workspace ./my-workspace # 合规审计
```

## 安装为 skill

### Claude Code（推荐）

```bash
# macOS / Linux
cp -r os-yuanli ~/.claude/skills/
```

安装后在任意对话里直接说「按 OS-原力 接管这个任务」或 `/os-yuanli` 即可触发。

### Codex CLI

```bash
cp -r os-yuanli ~/.codex/skills/
```

入口由 `os-yuanli/agents/openai.yaml` 注册，`display_name` 为 `OS-原力`。

### 纯手工使用

如果你不用上面两种 runtime，也可以把 `os-yuanli/SKILL.md` 当成一份 system prompt，粘贴到任何 LLM 对话里。

## 目录结构

```
os-yuanli/
├── SKILL.md                       # 主入口（Claude Code 自动识别）
├── agents/
│   └── openai.yaml                # Codex 入口
└── references/
    ├── constitution.md            # 宪法：六判断 + 治理三线 + 3×3 矩阵
    ├── task-family-map.md         # 任务族识别 + 各族产物包
    └── output-contract.md         # full mode / light mode 输出规则
```

## 核心一句话

> 先判断这件事值不值得进入，再判断它该怎么赢，最后才谈怎么做；做完之前必须验真，做完之后必须留下一条可复用的进化。

## 使用建议

- **不要把所有任务都套 full mode**。短、低风险、路径明显的任务用 `light mode`，但三层 gate 不能省。
- **主题 gate 不过就停**。不要因为"执行看起来很容易"就跳过。
- **好观点 ≠ 好策略**。策略必须能解核心矛盾、有证据路径。
- **完成前验真**。artifact 真实存在、满足目标、没偏离主题。

## 协议边界

这份 skill 是**运行骨架**，不是**领域能力**。

- 它告诉你"该做什么判断"，不告诉你"n8n 节点怎么配"
- 它告诉你"策略弱了该停下来"，不替你写文案
- 它与你自己的 skill / tool / MCP 共存，由你在执行层自己路由

如果你想把它升级成某个领域的专用入口（比如内容生产、软件开发），在 `references/task-family-map.md` 对应族下扩展即可。

## License / 归属

内部分享使用。协议思想来自「原力OS」实践沉淀。
