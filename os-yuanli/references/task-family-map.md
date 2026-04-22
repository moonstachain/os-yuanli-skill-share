# 任务族映射

## 目标

Map work into a small set of families so `OS-原力` can adapt artifact names without changing the underlying method.

## Mode Selection

### `full mode`

Use when any of these are true:

- 多阶段
- 会用到多个 skill / 工具
- 影响金钱、信任、发布、对外沟通
- 用户明确要求深度思考

### `light mode`

Use when all of these are true:

- 任务短
- 低风险
- 执行路径明显
- 压缩版可见输出已足够

`light mode` 可以缩短可见产物包，但**不能省略三层 gate**。

## Families

### 1. 内容生产

#### Trigger Signals

- 写文章 / 公众号 / 标题 / 大纲 / 内容策划 / 视频脚本 / 小红书

#### Artifact Pack

- `Theme Brief`
- `Strategy Card`
- `Execution Run Sheet`
- `Publish Pack`
- `Evolution Note`

#### Theme Gate

- 这个内容主题值不值得进入当前主战场？
- 它服务品牌、销售、认知资产，还是只是一次性热点？

#### Strategy Gate

说明：

- target reader
- core promise
- current strategy layer
- evidence needs
- risk boundaries

#### Default Stop Conditions

- 没有明确读者
- 没有真实目标
- 只是蹭热点、无复利价值
- 结构未定却要求出稿

---

### 2. 研究审计

#### Trigger Signals

- 审计 / 盘点 / 研究 / benchmark / review / compare

#### Artifact Pack

- `Inquiry Brief`
- `Analysis Card`
- `Audit Run Sheet`
- `Audit Pack`
- `Evolution Note`

#### Theme Gate

- 这轮研究是否服务一个真实决策？
- 范围是否收敛到可验证的问题？

#### Strategy Gate

说明：

- current evidence surface
- current strategy layer
- comparison lens
- proof standard

#### Default Stop Conditions

- 研究问题仍模糊
- 证据面撑不起结论
- 产物只会变成摘要而非决策依据

---

### 3. 工作流自动化

#### Trigger Signals

- workflow / automation / n8n / Dify / Coze / 飞书工作流

#### Artifact Pack

- `Automation Brief`
- `Design Card`
- `Build Run Sheet`
- `Delivery Pack`
- `Evolution Note`

#### Theme Gate

- 这个自动化是否真的值得做，而不是一次性 annoyance？
- 目标是否清楚到可以 design 和 verify？

#### Strategy Gate

说明：

- orchestration target
- system choice rationale
- current strategy layer
- verification path

#### Default Stop Conditions

- 源和目的不清
- 缺清晰的 trigger / input / output 契约
- 缺验真路径

---

### 4. 接线部署

#### Trigger Signals

- deploy / 上线 / 接 webhook / 绑定平台 / connect / release

#### Artifact Pack

- `Rollout Brief`
- `Rollout Card`
- `Deployment Run Sheet`
- `Release Pack`
- `Evolution Note`

#### Theme Gate

- 现在是不是正确的 rollout timing？
- 这是试验性验证还是正式外部 release？

#### Strategy Gate

说明：

- rollout objective
- risk class
- current strategy layer
- rollback and verification plan

#### Default Stop Conditions

- 外部副作用不可逆但未授权
- 回滚路径不清
- 缺成功判定标准

---

### 5. 治理协作

#### Trigger Signals

- 组织设计 / 治理 / 协同 / 路由 / capability mapping / roadmap

#### Artifact Pack

- `Governance Brief`
- `Policy Card`
- `Governance Run Sheet`
- `Decision Pack`
- `Evolution Note`

#### Theme Gate

- 这是真的治理问题，还是一个披着治理外衣的领域执行问题？
- 这轮治理是否会减少未来摩擦？

#### Strategy Gate

说明：

- current system distortion
- desired operating rule
- current strategy layer
- adoption path

#### Default Stop Conditions

- 只是一次性 issue，不是结构性问题
- 新协议带来的管理成本高于它解决的问题

---

### 6. 软件开发

#### Trigger Signals

- PRD / 开发 / 写代码 / feature implementation / 从需求到交付

#### Artifact Pack

- `Dev Brief`
- `Architecture Card`
- `Dev Run Sheet`
- `Delivery Pack`
- `Evolution Note`

#### Theme Gate

- PRD 是否足够清晰（feature list + acceptance criteria）？
- 是否有可验证的 done condition？
- 这个任务值不值得进入完整流水线，还是手写几行就够？

#### Strategy Gate

说明：

- 并行度（任务数 vs 文件冲突面）
- coder 选择理由
- 测试 / 闭环覆盖
- current strategy layer
- 依赖图深度

#### Default Stop Conditions

- PRD 没有 feature list / acceptance criteria
- 项目过小，不值得启动完整流程
- 技术栈不明，无法生成 test plan

---

### 7. 未知或混合任务

#### Trigger Signals

- 跨多个族
- 压缩后仍模糊
- 没有单一族明显胜出

#### Artifact Pack

- `Task Brief`
- `Strategy Card`
- `Execution Run Sheet`
- `Result Pack`
- `Evolution Note`

#### Default Stop Conditions

- 没有主导目标
- 没有最小可行族
- 分解仍不稳定

---

## Routing Note

除了「内容生产」有约定链路外，其他族默认由使用者的 runtime 自行选择最小可用执行集。

本 skill 只规定**决策骨架**和**产物包名称**，不绑定具体工具。

## 高阶混合模式：系统行为审计

当请求明显大于单一族（系统盘点 / 生态审计 / 行为审计 / maturity review / scorecard），按 `研究审计 + 治理协作` 混合处理，并强制：

- `full mode`
- 显式打分
- 显式扣分理由
- 显式改进 roadmap

### Default Audit Output

用研究审计产物包作为主产物：

- `Inquiry Brief` / `Analysis Card` / `Audit Run Sheet` / `Audit Pack` / `Evolution Note`

当审计结论涉及操作规则时，追加治理附录：

- `Decision Pack`

### Required Audit Extras

系统级审计额外产出：

- `System Scorecard`
- `Subsystem Scorecards`
- `Deduction Ledger`
- `Roadmap`

### Default Stop Conditions

- 证据面太弱
- 时间边界未定
- 审计对象未命名
- 产物会变成大型清单倾倒而非决策级打分卡
