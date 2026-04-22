# Guides & Sensors

本协议定义 OS 的**双控回路**：

- `Guides`：在 AI 行动**之前**设好规则（前馈控制）
- `Sensors`：在 AI 行动**之后**检测偏差（反馈控制）

两者缺一不可。

## 为什么需要双控

只有 Guides（前馈）没有 Sensors（反馈）：
规则看起来完备，但没人知道规则是否被真的遵守。

只有 Sensors（反馈）没有 Guides（前馈）：
每次都要事后救火，错误模式会反复复现。

双控回路 = `规则写在前 + 偏差检测在后 + 进化沉淀回规则`。

## Guides（前馈）

在任务进入执行层**之前**就存在的约束。

### 默认 guide 清单

至少包含这 5 类（使用者可扩展）：

1. **全局 CLAUDE.md / AGENTS.md 一类的 runtime 配置**
   声明项目级偏好、敏感约束、默认行为。
2. **权限三级**
   - ✅ 自动执行
   - ⚠️ 需确认
   - 🚫 禁止
3. **红线（hard limits）**
   一旦触发立即停机的条件，比如"不写入 production 数据库"。
4. **分层依赖规则**
   参见 `layer-dependencies.md`——谁可以调用谁。
5. **任务级 Done Condition**
   见 `task-protocol.md`。

### Guide 可写入的位置

- 全局：项目根的 `CLAUDE.md` / `AGENTS.md` 等配置
- skill 级：skill 内部的 `SKILL.md` + references
- 任务级：任务 .md 的 frontmatter 与正文

越靠近任务的 guide 优先级越高（见 `truth-hierarchy.md`）。

## Sensors（反馈）

在任务声明完成之后运行的**自动化检测**。

### 默认 sensor 清单

至少包含这 4 类：

1. **Evidence 验真**
   对齐 Done Condition 的可执行检查——文件存在、diff 合法、测试通过等。
2. **自动化测试 / lint**
   代码类任务的硬门槛。
3. **状态聚合**
   例如"某状态卡住 > N 天"的告警。
4. **定时健康巡检**
   跨任务维度的系统性检测——文档完整性、依赖健康度、配置漂移。

### Sensor 的触发时机

- **同步**：任务声明 completed 时立即跑
- **异步**：定时调度（见 `backflow-channels.md`）
- **被动**：有人查询时才算

三种都可以，但必须写明在哪个时机跑，否则"有 sensor 等于没 sensor"。

## 闭环：Guides ↔ Sensors ↔ Evolution

```
 Guide 定下规则
      │
      ▼
  AI 执行任务
      │
      ▼
 Sensor 检测结果
      │
      ├─ 合规 → Evolution 沉淀成功模式 → 可能升级为新 skill
      │
      └─ 偏差 → Evolution 设计新 Guide → 回到起点加强前馈
```

这个闭环就是 OS **自进化**的发动机。

## 最小合规要求

使用 os-yuanli 的 setup 至少要有：

- 1 份全局 guide 文件（任意形式）
- 1 个 Evidence 验真 sensor
- 1 条 Evolution 沉淀规则

三者缺一不算合规 setup。

## Inclusion

- 双控回路的结构定义
- Guide 与 Sensor 各自的最小清单
- 闭环路径
- 合规 setup 的最小三件套

## Exclusion

本协议**不规定**：

- Guide 用什么文件格式（Markdown / YAML / JSON 都可以）
- Sensor 用什么工具实现（hook / CI / cron / 专用 daemon）
- 定时巡检的具体频率
- 告警推送到哪里（Slack / 邮件 / dashboard）

这些都是使用者的实现自由度。
