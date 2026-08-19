# Dev Co-Pilot

一套开源的 AI 开发协作 Skill。它把 AI 从一个"直接回答 / 直接改代码"的工具，变成**遵守纪律、以证据为导向**的开发协作者。

覆盖日常开发全流程：**代码理解 → 改造前业务查询 → 问题排查 → 方案设计 → 代码修改 → 测试验收 → Git → 接口 → 安全 → 上线 → 文档沉淀 → AI 代码长期维护**。

## 特性

- **证据驱动**：所有结论必须基于代码、日志、命令输出，并标记为 `已确认 / 高概率 / 待验证`
- **先读后改**：默认只读分析；改代码前先出方案和影响范围
- **渐进式披露**：`SKILL.md` 保持精简，14 个场景库（含示例）按需加载，不浪费上下文
- **安全红线**：不执行高风险操作、不输出真实凭据（默认禁止 push / reset --hard / 删数据）
- **跨平台安装**：macOS / Linux / Windows 一键脚本
- **即用型**：装好后在任何项目里用自然语言触发对应场景，附 `usage-examples.md` 可直接套用

## 目录结构

```
dev-co-pilot/
├── install.sh                     # macOS / Linux 安装脚本
├── install.ps1                    # Windows 安装脚本
├── README.md
└── .claude/
    └── skills/
        └── dev-co-pilot/          # Skill 本体
            ├── SKILL.md           # 全局规则 + 场景路由（入口）
            ├── references/        # 13 个场景库（按需加载）
            │   ├── code-understanding.md   # 代码理解
            │   ├── refactor-query.md       # 改造前业务查询
            │   ├── troubleshooting.md      # 问题排查
            │   ├── design.md               # 方案设计
            │   ├── code-modify.md          # 修改代码
            │   ├── testing.md              # 测试与验收
            │   ├── git.md                  # Git
            │   ├── api-curl.md             # 接口与 curl
            │   ├── security.md             # 安全审查
            │   ├── release.md              # 上线与发布
            │   ├── docs-summary.md         # 文档与总结
            │   ├── maintenance.md          # AI 代码长期维护
            │   ├── quick-one-liner.md      # 一句话版
            │   └── usage-examples.md       # 各场景真实对话示例
            └── assets/
                └── maintenance-register.md # AI 代码维护台账模板
```

## 安装

这是一个 Claude Code Skill，CCSwitch 启动或管理 Claude Code 时会沿用 Claude Code 的 Skill 发现规则。Skill 按约定存放在用户目录 `~/.claude/skills/`（用户级）或项目目录 `.claude/skills/`（项目级）；仓库自带的安装脚本会自动完成复制。

### 方式一：用户级（推荐，所有项目生效）

把 skill 安装到用户级目录 `~/.claude/skills/`，对所有 Claude Code 项目生效。

```bash
# macOS / Linux（进入仓库根目录后执行）
cd dev-co-pilot
./install.sh

# Windows PowerShell（进入仓库根目录后执行）
cd dev-co-pilot
.\install.ps1
```

### 方式二：项目级（跟随仓库，团队成员共享）

把 skill 安装到当前项目的 `.claude/skills/`，随仓库分发给协作者。

```bash
# macOS / Linux
./install.sh --project

# Windows PowerShell
.\install.ps1 -Project
```

> 注意：仓库内 `dev-co-pilot/` 自身已包含 `.claude/skills/` 结构，clone 后可直接作为项目级 Skill 使用；如需用户级全局生效，运行上面的安装脚本即可。

安装后重启或重载 Claude Code（包括经 CCSwitch 启动的 Claude Code）即可激活。

### 完整安装步骤（从零开始）

以下是从 clone 到生效的完整命令序列。

**macOS / Linux：**

```bash
# 1. 克隆仓库
git clone https://github.com/yd3wf/dev-co-pilot.git
cd dev-co-pilot

# 2. 赋予执行权限并安装（用户级，全局生效）
chmod +x install.sh
./install.sh

# 3. 重启或重载你的 AI 助手，即可在任意项目中使用
```

**Windows PowerShell：**

```powershell
# 1. 克隆仓库
git clone https://github.com/yd3wf/dev-co-pilot.git
cd dev-co-pilot

# 2. 安装（用户级，全局生效）
.\install.ps1

# 3. 重启或重载你的 AI 助手，即可在任意项目中使用
```

如果 PowerShell 提示禁止运行脚本，先放开当前会话的执行策略：

```powershell
Set-ExecutionPolicy -Scope Process Bypass
.\install.ps1
```

## 使用

装好后，直接用自然语言描述任务，Skill 会自动路由到对应场景库。例如：

- "定位一下**订单创建**功能的完整实现，给调用链和行号"
- "排查接口 `/pay/callback` 返回 500 的原因，先不要改代码"
- "给**商户版本升级**设计一个最小改造方案"
- "检查当前 `git diff` 影响范围"
- "对**订单模块**做一次只读安全审查"

每条提示词都遵循统一的全局规则，并把"待验证""只读""不要凭猜测下结论"等约束内置进去。

完整的真实对话示例见 `references/usage-examples.md`，覆盖全部场景，复制改占位符即可用。

## 如何扩展到自己的项目

这个 skill 刻意保持**项目无关**，因此任何团队都能直接复用。如果你想叠加自己团队/项目的规范，推荐的做法是：

1. **不要改核心 `SKILL.md`**——那是全局工作守则，改了会影响通用性。
2. 在 `references/` 里**新增**你的规范文件，例如 `references/my-team-conventions.md`，写入：命名规范、目录约定、错误码表、常用库、部署流程等。
3. 在 `SKILL.md` 的"场景路由"表里加一行，把对应意图指向你的新文件。

这样升级上游模板时，你的自定义部分不会冲突，也方便回传给社区。

## 推荐使用顺序

```
描述目标 → 提供现状和证据 → 只读分析 → 确认方案 → 最小范围修改 → 编译/测试/接口验证 → 检查 git diff → 沉淀文档和清单
```

最有效的提示词，不是最长的提示词，而是让 AI 清楚知道：**目标是什么、证据在哪里、边界是什么、完成标准是什么**。

## 贡献指南

欢迎 PR。请遵循以下约定：

1. **内容**：新增场景请先讨论定位，避免与现有场景重叠。
2. **语言**：`SKILL.md` 和 `references/` 使用英文编写（面向公开开源），`assets/` 模板和注释可用中文。
3. **结构**：详细提示词放到 `references/`，`SKILL.md` 只保留路由和全局规则。
4. **验证**：改完跑一遍 `scripts/validate`（见下）确认结构合法。
5. **变更记录**：在 `CHANGELOG.md` 追加条目。

## 本地校验与打包

```bash
# 校验 skill 结构是否合法（目录名、frontmatter、必需文件）
python scripts/package_skill.py .claude/skills/dev-co-pilot ./dist
```

校验通过会生成 `dist/dev-co-pilot.zip`，可用于离线分发。

## License

[MIT](./LICENSE)
