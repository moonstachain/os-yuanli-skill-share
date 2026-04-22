# Enable CI (one-time setup)

因本仓库的初始 OAuth token 没有 `workflow` scope，CI workflow 文件暂放在 `docs/proposed-workflow.yml`，请仓库 owner 一次性启用：

## 方式 A · Web UI（最简单）

1. 打开 GitHub 仓库页面
2. `Settings` → `Actions` → `General` → 确认 Actions 已启用
3. 在 web 上新建文件 `.github/workflows/validate.yml`，内容复制自 `docs/proposed-workflow.yml`
4. commit 到 main

## 方式 B · 本地 push（需要 token 升级）

```bash
gh auth refresh -s workflow -h github.com
mkdir -p .github/workflows
mv docs/proposed-workflow.yml .github/workflows/validate.yml
git add .github docs
git commit -m "ci: enable validate workflow"
git push
```

## 启用后效果

每次 push 与 PR 自动跑：

- `os-yuanli-doctor`（skill 完整性）
- `os-yuanli-audit`（协议合规）
- `tests/golden-path.sh`（集成测试）

本地也可以随时手动跑任一命令。
