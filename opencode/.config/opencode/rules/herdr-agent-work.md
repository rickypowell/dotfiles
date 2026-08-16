# Herdr Agent Work Rule

When `HERDR_ENV=1`, you are running inside a Herdr-managed terminal.

## Rule: Delegate work to Herdr agents

Never make file changes, run git commands, or perform work manually. Always start an agent in a Herdr pane and let it do the work.

## Workflow

1. **Check**: If `HERDR_ENV=1`, you must use the agent workflow below.
2. **Create worktree** (if needed): `herdr worktree create --label "<label>" --branch "<branch>" --no-focus`
3. **Split pane**: `herdr pane split --current --direction right --cwd "$PWD" --no-focus`
4. **Start agent**: `herdr agent start <name> --kind opencode --pane <pane-id>`
5. **Prompt agent**: `herdr agent prompt <name> "<task>" --wait --timeout 120000`
6. **Read output**: `herdr agent read <name> --source recent-unwrapped --lines 120`
7. **Wait for completion**: `herdr agent wait <name> --timeout 120000`

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
