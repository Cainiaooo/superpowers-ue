# UE-Custom

## 目的
这里放置 UE 项目专用的 Custom Skills，用于覆盖 superpowers 原生同名技能。

## 使用方式（Codex）
根据 `docs/README.codex.md` 的“Personal Skills”机制，`~/.codex/skills/` 中的同名技能会覆盖库内技能。

**推荐做法（复制或软链其一）：**

复制：
```bash
mkdir -p ~/.codex/skills
cp -r /mnt/d/Project/superpowers-ue/UE-Custom/skills/* ~/.codex/skills/
```

软链：
```bash
mkdir -p ~/.codex/skills
ln -s /mnt/d/Project/superpowers-ue/UE-Custom/skills/* ~/.codex/skills/
```

## 说明
- 这些技能为 UE 适配版：测试/PIE 验证为建议项，不强制要求执行或回填结果。
- worktree 默认关闭，仅在用户明确要求时启用。
- 适配原则与更新流程见 `UE适配说明.md`。
- 上游同步脚本：`tools/update-from-upstream.sh`。
