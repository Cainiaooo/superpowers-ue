---
name: requesting-code-review
description: Use when completing tasks, implementing major features, or before merging to verify work meets requirements
---


# 请求代码评审（UE 适配）

## 概述
评审是建议流程，用于在合并前发现问题。根据任务复杂度可选择执行。

## 何时请求评审（建议）
- 完成较大功能或复杂改动后
- 合并主分支前
- 修复疑难问题后

## 评审关注点（UE C++）
- 反射宏：`UCLASS/USTRUCT/UENUM` 是否完整
- GC：`UPROPERTY` 是否正确标注引用
- 生命周期：`BeginPlay`/`Tick`/`OnRegister` 安全性
- Replication：`GetLifetimeReplicatedProps` 与 `ReplicatedUsing` 一致性
- Blueprint 暴露：`UPROPERTY`/`UFUNCTION` 可见性与元数据
- 配置：`Config/*.ini` 键名变更是否说明回滚方式

## 如何请求（可选）
1. 获取对比范围：
```bash
BASE_SHA=$(git rev-parse HEAD~1)
HEAD_SHA=$(git rev-parse HEAD)
```
2. 使用 `requesting-code-review/code-reviewer.md` 模板调起评审
3. 按评审反馈进行修正（可选）

## 说明
- 评审不是强制门槛，但建议在关键改动后执行。
