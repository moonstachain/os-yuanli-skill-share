# Roadmap

`os-yuanli` 分 4 个 milestone 演进，每个版本独立可用。

## M1 · v0.2 · Capability Pack（本 PR）

把 canvas 里的 8 个可迁移模式从"图"变成"协议文件"，放在 `os-yuanli/protocols/`。

- [x] task-protocol.md
- [x] router-five-axes.md
- [x] brain-tiers.md
- [x] guides-and-sensors.md
- [x] evolution-flywheel.md
- [x] truth-hierarchy.md
- [x] backflow-channels.md
- [x] layer-dependencies.md
- [x] SKILL.md References 注册

**Done condition**：kernel 仍可独立运行，protocols 是**可选加载**。

## M2 · v0.3 · Adapter Templates

让同事按自己的环境实例化。

- [x] templates/themes.yaml.template
- [x] templates/runtime.yaml.template
- [x] templates/bridges.yaml.template
- [x] templates/cockpit.template.md
- [x] templates/task.template.md
- [x] templates/daemon.template.yaml（optional）
- [x] SKILL.md Templates 栏注册
- [x] 每个模板反向引用对应 protocol 的 Exclusion 段

## M3 · v0.4 · Onboarding CLI

`git clone` → 一个命令 → 得到可用 workspace。

- [x] bin/os-yuanli-init（交互式向导 + `--non-interactive` for CI）
- [x] bin/os-yuanli-doctor（环境检查）
- [x] bin/os-yuanli-audit（repo 自审 + workspace 合规审计）
- [x] CI：GitHub Actions 跑 doctor + audit + golden-path
- [x] Golden-path：init → task → audit 正反两路

## M4 · v1.0 · Reference Implementations & Docs

- [x] examples/minimal-setup/
- [x] examples/team-engineer-setup/
- [x] examples/hay-setup/（作者个人实例，标注清楚）
- [x] docs/quickstart.md（30 分钟 onboarding）
- [x] docs/concepts.md
- [x] docs/adapter-guide.md
- [x] docs/faq.md

## 不做的事

为避免方案膨胀，显式声明**不进 skill 主体**：

- HAY 的六大主题（quant / macro / chuangye / liuliang / zhiku / zhongtai）
- OB Vault + Dataview 依赖
- 飞书 / GitHub / 知识星球的私有 bridge 实例
- personal-cockpit.md 的具体实现
- 任何写死作者身份的 prompt 或文案

以上都只在 `examples/hay-setup/` 作为**参考样板**出现。
