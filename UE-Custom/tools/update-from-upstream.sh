#!/usr/bin/env bash
set -euo pipefail

# UE-Custom 同步脚本：上游更新 -> main 快进 -> 合并到 ue-custom

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
cd "$ROOT_DIR"

require_clean() {
  if ! git diff --quiet || ! git diff --cached --quiet; then
    echo "工作区不干净，请先提交或暂存后再执行。"
    exit 1
  fi
}

ensure_remote() {
  if ! git remote get-url upstream >/dev/null 2>&1; then
    echo "缺少 upstream 远端，请先执行："
    echo "  git remote add upstream https://github.com/obra/superpowers.git"
    exit 1
  fi
}

require_clean
ensure_remote

echo "获取 upstream 更新..."
git fetch upstream

# 选择 upstream 的主分支
UPSTREAM_MAIN=""
if git show-ref --verify --quiet refs/remotes/upstream/main; then
  UPSTREAM_MAIN="upstream/main"
elif git show-ref --verify --quiet refs/remotes/upstream/master; then
  UPSTREAM_MAIN="upstream/master"
else
  echo "未找到 upstream/main 或 upstream/master。"
  exit 1
fi

echo "切到 main 并快进到 ${UPSTREAM_MAIN}..."
git checkout main
require_clean

# 仅允许 fast-forward
if ! git merge --ff-only "$UPSTREAM_MAIN"; then
  echo "main 无法快进，请手动处理冲突或检查本地改动。"
  exit 1
fi

echo "可选：如需推送 main，请手动执行："
echo "  git push"

echo "切到 ue-custom 并合并 main..."
git checkout ue-custom
require_clean

if ! git merge main; then
  echo "合并出现冲突，请手动解决后再继续。"
  exit 1
fi

echo "完成。建议检查 UE-Custom 适配是否仍满足："
echo "- 验证为建议项"
echo "- PIE 由真人执行"
echo "- worktree 默认关闭"
echo "- Custom Skill 不引用外部路径"

echo "如需推送 ue-custom，请手动执行："
echo "  git push -u origin ue-custom"
