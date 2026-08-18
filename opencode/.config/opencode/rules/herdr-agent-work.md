# Herdr Agent Work Rule

When `HERDR_ENV=1`, you are running inside a Herdr-managed terminal.

## Rule: Delegate work to Herdr agents

Never make file changes, run git commands, or perform work manually. Always start an agent in a Herdr pane and let it do the work.

## Workflow

1. **Check**: If `HERDR_ENV=1`, you must use the agent workflow below.
2. **Create worktree** (if needed): `herdr worktree create --label "<label>" --branch "<branch>" --no-focus`
3. **Split pane**: `herdr pane split --current --direction right --cwd "$PWD" --no-focus`
4. **Ask user for model**: Extract recently used models from session data:
   ```bash
   for s in $(opencode session list 2>/dev/null | tail -n +3 | awk '{print $1}' | head -50); do
     opencode export "$s" 2>/dev/null | jq -r '.model.id'
   done | sort | uniq -c | sort -rn | head -5
   ```
   Show the top 5 most-used models and let the user pick one or type a custom model name.
5. **Start agent**: `herdr agent start <name> --kind opencode --pane <pane-id> -- -m "<chosen-model>" --agent build`
6. **Prompt agent**: `herdr agent prompt <name> "<task>" --wait --timeout 120000`
7. **Read output**: `herdr agent read <name> --source recent-unwrapped --lines 120`
8. **Wait for completion**: `herdr agent wait <name> --timeout 120000`

## Prohibited

- Running git commands directly
- Editing files directly
- Making commits yourself
- Using `bash` or `edit` tools for work tasks

## Allowed

- Using Herdr CLI to inspect state (`herdr agent list`, `herdr pane list`)
- Waiting for agents (`herdr agent wait`)
- Reading agent output (`herdr agent read`)
- Splitting panes and starting agents
