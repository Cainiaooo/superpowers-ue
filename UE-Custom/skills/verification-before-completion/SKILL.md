---
name: verification-before-completion
description: Use when about to claim work is complete, fixed, or passing, before committing or creating PRs; verification is recommended but not mandatory
---


# 完成前验证（建议）

## 概述
完成声明前建议提供验证证据，但不作为强制门槛。若未验证，建议明确说明“未验证，需人工确认”。

**PIE 验证建议由真人开发者执行，AI 不代跑，仅提供步骤与证据建议。**

## 建议的验证类型（可选）
- AutomationTest（若已存在）
- PIE/Editor 验证步骤
- 日志证据（`UE_LOG` 分类与关键字段）
- 复现步骤 + 截图/录屏说明

## 建议流程（可选执行）
1. **识别可用的验证方式**
2. **执行验证（可选）**
3. **记录证据（可选）**
4. **若未验证，明确标注原因与后续计划**

## 推荐表述
- 已验证：说明方式与证据
- 未验证：说明原因，并提示需要人工确认

## 示例
```
已验证（PIE）：在关卡 X 进入战斗，角色释放技能后伤害数值正确。证据：日志关键行 + 截图路径。

未验证：当前变更未进行 PIE 验证，原因是引擎构建中断；需要开发者在关卡 X 手动确认。
```
