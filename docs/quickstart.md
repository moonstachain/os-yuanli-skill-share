# Quickstart · 30 分钟上手

目标：30 分钟内，从 `git clone` 到创建你的第一个合规任务并通过审计。

## 前置

- Python 3.9+
- Git
- 可选：Claude Code / Codex / 其他 runtime
- 可选：`pip install pyyaml`（audit 更严谨）

## Step 1 · Clone & Check（2 分钟）

```bash
git clone https://github.com/moonstachain/os-yuanli-skill-share.git
cd os-yuanli-skill-share
python3 bin/os-yuanli-doctor
```

看到 `18 通过 / 0 警告 / 0 错误` 说明 skill 文件齐全。

## Step 2 · 装成 skill（1 分钟）

### Claude Code

```bash
cp -r os-yuanli ~/.claude/skills/
```

### Codex

```bash
cp -r os-yuanli ~/.codex/skills/
```

装完可以在对话里直接 `/os-yuanli` 或 "按 OS-原力 接管这个任务"。

## Step 3 · 初始化 workspace（5 分钟）

```bash
python3 bin/os-yuanli-init --workspace ~/my-os-workspace
```

向导会问 6 个问题：

1. 你要打哪几场仗？（定义 3–7 个主题）
2. 用什么 runtime？（claude-code / codex / manual）
3. 要不要加人工兜底？
4. 要不要接 Obsidian？
5. 任务 `.md` 放哪？
6. 要不要 daemon？

填完会生成 `themes.yaml`、`runtime.yaml`、`bridges.yaml`、`tasks/` 目录。

如果你只想先感受一下，跳过交互用：

```bash
python3 bin/os-yuanli-init --workspace ~/my-os-workspace --non-interactive
```

## Step 4 · 创建第一个任务（5 分钟）

```bash
cp os-yuanli/templates/task.template.md ~/my-os-workspace/tasks/T-0001-first.md
# 用你熟悉的编辑器改 frontmatter 和正文
```

至少填完：

- `theme`：必须是 `themes.yaml` 里定义的 id
- `runtime`：必须是 `runtime.yaml` 里定义的 id
- `status`: `planning` 或 `pending`
- `## Done Condition`、`## Why`、`## How` 三段

## Step 5 · 跑一次 audit（1 分钟）

```bash
python3 bin/os-yuanli-audit --workspace ~/my-os-workspace
```

看到 `✅ 全部通过` 说明合规。

如果 audit 报错，对照错误信息改任务 `.md`——这些规则在 `os-yuanli/protocols/task-protocol.md` 里都有说明。

## Step 6 · 让 skill 接管（剩下时间）

在支持 skill 的 runtime 里：

```
/os-yuanli

任务在 ~/my-os-workspace/tasks/T-0001-first.md
```

skill 会：

1. 读任务文件
2. 跑六判断 + 主题 gate + 策略 gate
3. 选 runtime 执行
4. 完成前验真 + 填 Evidence
5. 闭环时写 Evolution

## 常见卡点

- **向导没问我想要的字段** → 按 M2 的 Evolution Note，向导的问题 1:1 映射到 templates/ 字段。如果你想更精细（比如额外的主题元数据），直接编辑生成的 yaml 即可。
- **audit 说 theme 未声明** → 你在任务里写的 `theme` 必须先在 `themes.yaml` 里加一条。
- **closed 状态被拒** → closed 前必须写 Evolution 段。这是硬约束，别绕。

## 下一步

- 读 [concepts.md](concepts.md) 理解为什么是这套结构
- 读 [adapter-guide.md](adapter-guide.md) 把工作流接到外部系统
- 读 [faq.md](faq.md) 看常见问题
