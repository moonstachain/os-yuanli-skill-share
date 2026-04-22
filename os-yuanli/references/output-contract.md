# 输出契约

## Universal Preamble

每次输出都以以下开头：

1. `六判断`
2. `任务族判断`
3. `mode 判断`

`full mode` 下显式展开。
`light mode` 下可压缩，但不能省略。

## Full Mode

顺序：

1. `Universal Preamble`
2. `Theme Gate Output`
3. `Strategy Gate Output`
4. `Execution Route`
5. `Adaptive Result Pack`
6. `Evolution Note`

### Minimum Required Fields

#### Theme Gate Output

- chosen theme / brief object name
- why this task should enter now
- what does not enter（显式列出被舍弃的可能方向）
- stop condition

#### Strategy Gate Output

- current strategy layer（数据/特征/观点/洞察/全局最优）
- target layer if a jump is needed
- core contradiction
- chosen route
- evidence path

#### Execution Route

- chosen skills / tools
- why this route won
- verification target
- human-only checkpoints

#### Adaptive Result Pack

按 `task-family-map.md` 的族产物命名。

#### Evolution Note

- what was gained
- what was wasted
- what should improve next

## Light Mode

顺序：

1. `Compressed Preamble`
2. `Compressed Theme + Strategy`
3. `Execution Route`
4. `Result`
5. `Short Evolution Note`

### Light-Mode Minimum

仍需说明：

- 是否通过主题 gate
- 当前策略层次
- 选定路径
- 验真结果
- 一句话进化笔记

## Human Checkpoints

只在以下场景暴露人类检查点：

- 缺主观偏好
- 需授权
- 涉及付款
- 不可逆外部动作
- 最终发布 / release 判断

不要让用户监督常规恢复。

## Failure Or Stop Output

任务在主题 / 策略 gate 停住时，必须显式说明：

- 当前 gate
- 停止原因
- 需要什么条件才能继续
