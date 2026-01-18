---
name: using-git-worktrees
description: Use only when the user explicitly requests a worktree or strict isolation is required; UE 默认不启用 worktree
---


# 使用 Git Worktrees（UE 适配）

## 概述
UE 项目体积大、资产多，**默认不使用 worktree**。只有在用户明确提出需要 worktree 或隔离工作区时才启用该流程。

**开头声明**："我正在使用 using-git-worktrees 技能准备隔离工作区。"

## 默认策略（无明确指示时）
- 不启用 worktree。
- 建议使用分支策略进行隔离（例如 `feature/*`），并在完成后清理分支。

## 启用条件（必须满足其一）
- 用户明确提出“使用 worktree”。
- 用户要求强隔离（并行开发、长周期试验、重度改动）。

## 启用后的建议流程（可选执行）

### 1) 目录选择
优先顺序：
- `.worktrees/`
- `worktrees/`
- `CLAUDE.md` 指定目录
- 无明确目录时询问用户

### 2) 忽略检查（建议）
若使用项目内目录，建议确认已在 `.gitignore` 中忽略，避免误提交。

### 3) 创建与初始化
按需创建 worktree，并执行最小化初始化（例如生成项目文件）。

### 4) 基线验证（可选）
UE 项目不强制跑自动化测试。可选择：
- 编译通过
- PIE 小场景验证（真人执行）

## 注意事项
- 未经用户明确要求，不要自动启用 worktree。
- 不强制运行测试或提供验证证据。
- 若不使用 worktree，可用分支+清理策略替代。
