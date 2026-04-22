# Backflow Channels

任务执行产生的结果必须**回流**——进入任务文件、产物目录、dashboard、外部系统。

本协议把回流路径抽象成三类通道，每类给出契约，不绑定具体工具。

## 为什么需要抽象

HAY 的原始系统里有三条具体回流：

- Claude Code → 直写 OB 文件（秒级）
- Codex → GitHub commit → git pull（分钟级）
- 飞书多维表 → MCP 拉取（按需）

这是 HAY 的**实例**。通用协议不应该写死 OB / GitHub / 飞书。

真正的结构是：

- **本地同步通道**：runtime 直接写本地 workspace
- **异步远程通道**：runtime 产出提交到远端，本地按节奏拉回
- **外部系统通道**：结果要出现在第三方系统里，通过 bridge 双向同步

## 三通道契约

### Channel 1 · Local Sync · 本地同步

**特征**：

- 写入延迟 < 秒级
- runtime 与 workspace 在同一文件系统
- 典型实现：编辑器内 Agent、桌面 CLI、本地 hook

**契约**：

- 必须原子写入（写到临时文件再 rename）
- 必须更新任务 .md 的 `status` 和 `artifacts`
- 必须触发至少一个 sensor（见 `guides-and-sensors.md`）

### Channel 2 · Async Remote · 异步远程

**特征**：

- 写入延迟分钟级或更久
- runtime 在独立沙箱，产物通过版本控制或对象存储回流
- 典型实现：远程异步执行 agent、CI 任务、跨机 pipeline

**契约**：

- 产物必须在可追溯的 commit / artifact id 下（可回滚）
- 必须在回流时生成一次 sensor run（不能只依赖本地 sync）
- 超出 SLA（例如 30 分钟无回流）必须触发 `blocked` 或 `escalated`

### Channel 3 · External System · 外部系统

**特征**：

- 真源在第三方（表格、项目管理工具、IM、邮箱）
- 通过 adapter / bridge 与 workspace 双向同步
- 典型实现：表格工具 MCP、项目管理工具 API、IM webhook

**契约**：

- 必须声明**哪边是真源**（workspace 为真 / 外部系统为真 / 镜像）
- 冲突时按 `truth-hierarchy.md` 处理
- bridge 的失败必须是**显式**的——不能静默跳过
- 所有外部副作用必须可回滚或可补偿

## 通道选择

按任务特征选通道：

| 任务特征 | 推荐通道 |
|---|---|
| 短平快、在本机执行 | Channel 1 |
| 长时间跑、不阻塞 UI | Channel 2 |
| 跨工具 / 跨人协作 | Channel 3 |
| 混合（边做边同步） | 1 + 3 组合 |

路由决策参见 `router-five-axes.md`——回流通道本身也是"选路"的一部分。

## 通用回流字段

不管走哪条通道，回流时**都要更新**任务文件的：

- `status`：按 `task-protocol.md` 状态机
- `artifacts`：产物的路径或 URL（相对路径优先）
- `outcome`：一句话摘要
- `closed`：如果进入 closed 状态

外加：

- Evolution 段落（见 `evolution-flywheel.md`）

## 失败模式

回流协议失败 = 整个 OS 失效。重点防：

### 静默成功
任务"看起来完成"，但没有写回任务 .md。

**防护**：把 `status` 的更新做成 sensor 硬检查。

### 双源漂移
Channel 3 下，workspace 与外部系统各自改了，没同步。

**防护**：明确单一真源 + 定时 diff 告警。

### 孤儿 artifacts
产物落了，但没有任务引用它。

**防护**：artifacts 字段必须是任务 .md 的一部分，没任务 .md 的 artifacts 视为垃圾。

## Inclusion

- 三通道的结构定义与契约
- 选择通道的启发式规则
- 回流必须更新的字段
- 失败模式与防护

## Exclusion

本协议**不规定**：

- 具体 adapter / bridge 的实现（OB / Notion / 飞书 / Linear / GitHub 任选）
- 具体 SLA 数值（Channel 2 的"超时"由使用者在 bridges.yaml 里定）
- 同步频率
- 是否使用消息队列 / webhook / 轮询

这些由使用者的 `bridges.yaml` 决定。
