---
name: systematic-debugging
description: Use when encountering any bug, test failure, or unexpected behavior, before proposing fixes
---


# 系统化排障（UE 适配）

## 概述
排障优先找“证据与根因”。本流程为建议性步骤，可按实际情况裁剪。

## 何时使用
- Bug、异常行为、性能问题
- 构建失败或集成问题

## 建议流程（可选执行）

### 阶段 1：收集证据
- 复现路径与触发条件
- 关键日志（`UE_LOG` 分类 + 关键字段）
- Actor/Component 关键变量快照
- 需要时使用 UE 工具采集证据：
  - Gameplay Debugger
  - Visual Logger
  - Unreal Insights
  - `DrawDebug*`

### 阶段 2：对比与定位
- 找到相似的“正常案例”
- 比较差异（配置、数据、输入、状态）
- 形成一个可验证的假设

### 阶段 3：最小验证
- 做最小改动验证假设
- 一次只改一个变量

### 阶段 4：修复与回归（可选）
- 修复根因
- 可选进行 AutomationTest 或 PIE 验证

## 注意事项
- 若无法复现，优先补充日志与可观察证据，再讨论修复方案。
- PIE 验证建议由真人开发者执行，AI 不代跑。
