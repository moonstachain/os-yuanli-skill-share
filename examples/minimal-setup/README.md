# Minimal Setup

**由 `os-yuanli-init --non-interactive` 自动生成**——这是 CLI 的"最小可跑"产物。

## 这个示例演示

- 1 个 demo 主题
- 1 个 runtime（claude-code）
- 纯本地文件回流（`local_files_only` 桥）
- 无 daemon

## 什么时候用

- 你只是想先跑起来，感受一下协议
- 个人单兵作战，不需要外部工具
- 不确定未来会不会用 Notion / OB / 飞书时，先留本地

## 复现

```bash
python3 bin/os-yuanli-init --workspace examples/minimal-setup --non-interactive
```

## 下一步

当你想扩充成真实工作流：

1. 编辑 `themes.yaml` 定义自己的主题（建议 3–7 个）
2. 编辑 `runtime.yaml` 加第二个 runtime（比如 `codex` 做异步长跑）
3. 如果要上 OB / Notion / 飞书，编辑 `bridges.yaml`
4. 从 `os-yuanli/templates/task.template.md` 拷一份任务开始干活
