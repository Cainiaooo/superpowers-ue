---
name: finishing-a-development-branch
description: Use when implementation is complete and you need to decide how to integrate the work; verification is recommended but not mandatory
---


# 收尾分支（UE 适配）

## 概述
在实现完成后给出合并/PR/保留/丢弃的选项。验证为建议流程，不强制要求执行或回填结果。

**开头声明**："我正在使用 finishing-a-development-branch 技能进行收尾。"

## 建议流程（可选执行）

### 步骤 1：可选验证
- 可运行测试或进行 PIE/Editor 验证（真人执行）。
- 若未验证，建议在说明中标注原因。

### 步骤 2：确定基线分支
```bash
git merge-base HEAD main 2>/dev/null || git merge-base HEAD master 2>/dev/null
```

### 步骤 3：给出 4 个选项
```
实现完成后你希望：

1. 本地合并到 <base-branch>
2. Push 并创建 PR
3. 保留分支（稍后处理）
4. 丢弃本次工作

请选择：
```

### 步骤 4：执行选择
- **选项 1：本地合并**
  - 合并后可选验证
  - 若需要可清理分支
- **选项 2：Push 并创建 PR**
  - PR 中可选填写验证说明
- **选项 3：保留分支**
  - 仅报告当前状态
- **选项 4：丢弃**
  - 需二次确认再执行删除

### 步骤 5：可选清理 worktree
- 仅在用户确认需要时清理

## 注意事项
- 不强制要求测试或 PIE 验证结果。
- 若未验证，建议明确标注“未验证，需人工确认”。
