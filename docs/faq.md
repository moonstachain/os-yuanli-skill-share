# FAQ

## 关于定位

### Q: 这个 skill 和"写一堆 prompt 模板"有什么区别？

prompt 模板告诉 AI "怎么写"，这个 skill 告诉 AI "**该做什么判断，在什么顺序上做**"。
前者是执行层，后者是决策层。可以共存——你的 prompt 模板仍然可以用，只是在 OS-原力 接管时会先过一遍三层 gate。

### Q: 这个 skill 和 GTD / OKR / Scrum 有什么区别？

GTD 是**个人时间管理**，OKR 是**目标设定**，Scrum 是**团队节奏**。
OS-原力 是**任务接管协议**——用在"AI 接手一个复杂任务时，怎么保证它不漂移、不假完成、能进化"。
三者可以叠加：用 OKR 定方向，用 GTD 管个人 inbox，用 OS-原力 接管每个有复杂度的任务。

### Q: 轻任务也要走三层 gate 吗？

走，但用 `light mode`——gate 不能省，但可以**极度压缩**。
一句话带过一层也合法。详见 `os-yuanli/references/output-contract.md`。

---

## 关于采用

### Q: 我们团队已经用 Notion / Linear / Jira 了，还要再引入一个协议？

不用"引入"，只是在你已有工具之上加一层**决策骨架**。
任务文件 `.md` 是真源，工具是镜像。你的 Notion 工作流不需要改，配一个 `bridges.yaml` 同步就行。

### Q: 同事必须学吗？我只是想自己用。

不必须。你一个人用完全可以。
整个 skill 从 kernel 到 CLI 都设计成单人可跑。同事如果想加入，只需要读 `docs/quickstart.md`。

### Q: 能在 Codex / OpenAI SDK / 自建 agent 上用吗？

能。skill 是协议 + 模板 + 校验工具，和具体 LLM runtime 无关。
`runtime.yaml` 里声明你用的 runtime 即可。

---

## 关于协议

### Q: 为什么任务必须用 `.md` 文件？不能用数据库吗？

文件在 git 里最容易被 LLM 安全读写、最容易 review、最容易版本控制。
用数据库也可以——配个 `bridge` 镜像过去，但**真源留在 `.md`**。

### Q: closed 必须写 Evolution，太啰嗦了

是的——这是**故意**的。
没有 Evolution 的闭环等于什么都没学到。哪怕写"本轮无新增进化"也要写，这是协议对 OS **自进化**的硬保证。

### Q: 我的任务经常卡在 blocked，dashboard 一片红

这正是 `blocked` 状态的价值——让你**看见**阻塞，而不是让它隐藏在"进行中"里。
如果某任务 blocked > 14 天，按默认 daemon 规则应自动 escalate 到 manual，由人决定：继续等 / 放弃 / 换路径。

### Q: audit 为什么要检查这么多？

每一条都是一种常见失败模式：

- 没 frontmatter → LLM / 脚本无法解析
- 非法 status → 状态机无法工作
- theme 未声明 → 聚合会错乱
- closed 无 Evolution → 违反自进化

删掉任何一条都会让 OS 失去一个关键保障。

---

## 关于工程

### Q: 为什么不把它做成一个 Python 包发 PyPI？

M1–M4 追求**可读 + 可 fork**，不追求分发便利。
包装成 PyPI 包会引入版本兼容、依赖管理等额外复杂度，目前没必要。
如果后续有需求，M5 可以考虑。

### Q: CI workflow 为什么要我手动启用？

初始 OAuth token 没有 `workflow` scope，本项目不想要求仓库 owner 现在就去申请升级。
合并 PR 后按 `docs/enable-ci.md` 走一次 Web UI 即可，1 分钟的事。

### Q: 为什么 doctor / audit / init 都是 shell 脚本风格而不是 Python 包？

`bin/` 里的脚本直接可执行、不需要 `pip install`、不需要 virtualenv。对非 Python 用户友好。
唯一依赖 `pyyaml` 也是**可选**的——没装时降级到简化解析器。

### Q: 我想加 skill-router / evidence-gate / 其他 skill 的联动

它们在作者的私有环境里存在，这个 share 版本**故意不依赖**它们。
你想加类似能力，建议：

1. 在 `os-yuanli/protocols/router-five-axes.md` 基础上写自己的 router
2. 在 `os-yuanli/protocols/guides-and-sensors.md` 基础上写自己的 evidence-gate
3. 用自己的名字，不要叫同名——避免和作者私有版本混淆

---

## 关于演进

### Q: 如何给这个项目贡献？

- 发现 protocol 不清楚 → 提 issue 或 PR 改 protocol
- 发现 template 缺字段 → 先问自己"这个字段是普适的吗"——如果是，提 PR；如果只是你自己的偏好，在本地 adapter 里加就行
- 有新的 example setup → 欢迎 PR 到 `examples/`

### Q: 会一直维护吗？

kernel + protocols 设计得尽量稳定——v1.0 之后预期变动小。
CLI 和 examples 会随使用反馈演进。
重大破坏性变更会走 major version（v2.0）。
