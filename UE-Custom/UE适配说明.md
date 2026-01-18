# UE 适配说明

## 目标
在持续跟进上游 superpowers 更新的同时，保持 UE 项目开发流程的适配要求。UE 适配只收敛在 `UE-Custom/` 下，通过 Custom Skill Override 机制覆盖同名技能。

## 覆盖机制
- Custom Skill 与原技能 **同名**（front matter 中的 `name` 相同）。
- 将 `UE-Custom/skills/*` 复制或软链到 `~/.codex/skills/`，即可覆盖库内同名技能。

## 适配原则（必须长期保持）
1. **验证为建议项**：测试/PIE 验证不强制要求执行或回填结果。
2. **PIE 由真人执行**：AI 只给出步骤与证据建议，不代跑。
3. **worktree 默认关闭**：仅在用户明确要求时启用，默认建议分支策略。
4. **避免外部引用**：Custom Skill 内不引用 `DevDocs/` 或仓库外路径；所需模板放在对应技能目录内。

## 当前覆盖清单与关键差异
- `test-driven-development`：改为“验证优先（建议）”，引用本地 `UE验证证据模板.md`。
- `verification-before-completion`：完成前验证改为建议流程，不强制证据。
- `systematic-debugging`：加入 UE 工具清单，流程为建议项。
- `writing-plans`：验证步骤为建议项，计划保存路径不绑定外部目录。
- `using-git-worktrees`：默认不启用 worktree，仅用户明确要求时启用。
- `requesting-code-review`：评审为建议流程，补 UE C++ 检查点。
- `finishing-a-development-branch`：收尾验证为可选，不强制测试。
- `executing-plans`：按计划执行但验证为可选项。

## 上游更新后的同步流程（建议）
1. 拉取上游更新（在 `main` 或镜像分支）。
2. 对比变更：
   - `skills/<skill>/SKILL.md` vs `UE-Custom/skills/<skill>/SKILL.md`
3. 把上游新增的内容/修复点合并到 UE-Custom，但保持 **适配原则** 不变。
4. 若上游新增技能，判断是否需要 UE 适配：
   - 需要：在 `UE-Custom/skills/` 新建同名覆盖
   - 不需要：保持原样
5. 更新本说明文档（记录新增或调整的覆盖点）。

## 自动化脚本
可使用 `UE-Custom/tools/update-from-upstream.sh` 执行标准流程：
- `main` 快进到 `upstream/main`（或 `upstream/master`）
- 合并 `main` 到 `ue-custom`
- 保留 UE 适配原则

## 更新检查清单
- [ ] 验证仍为建议项（未强制执行或回填）
- [ ] PIE 仍为真人执行建议
- [ ] worktree 默认关闭
- [ ] Custom Skill 不引用外部路径
- [ ] 必要模板已放在技能目录内
