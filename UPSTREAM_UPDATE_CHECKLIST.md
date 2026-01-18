# 上游更新后操作清单（简版）

## 适用分支
- `main`：始终跟踪上游 `upstream/main`
- `ue-custom`：仅包含 `UE-Custom/` 适配内容

## 推荐流程
1. 获取上游更新
   ```bash
   git fetch upstream
   ```
2. 快进 `main` 到上游
   ```bash
   git checkout main
   git merge --ff-only upstream/main
   git push
   ```
3. 合并 `main` 到 `ue-custom`
   ```bash
   git checkout ue-custom
   git merge main
   git push -u origin ue-custom
   ```
4. 按 UE 适配原则检查（见 `UE-Custom/UE适配说明.md`）

## 一键脚本（可选）
```bash
UE-Custom/tools/update-from-upstream.sh
```

## 适配检查清单（简要）
- 验证仍为建议项（不强制执行或回填）
- PIE 仍为真人执行建议
- worktree 默认关闭（需用户明确要求）
- Custom Skill 不引用外部路径
- 模板文件放在对应技能目录内
