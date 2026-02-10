/**
 * Plugin that runs an osascript (AppleScript) when the session becomes idle.
 * This is useful for macOS-specific actions like notifications, system commands, etc.
 */
const IdleOsascriptPlugin = async (ctx) => {
  const { $ } = ctx;
  const dir = ctx.directory.split("/").at(-1);
  const sessionIdle = `display notification "Awaiting your next instruction" with title "${dir}" sound name "Funk"`;
  return {
    event: async ({ event }) => {
      if (event.type === "session.idle") {
        await $`osascript -e ${sessionIdle}`;
      }
    },
  };
};

export default IdleOsascriptPlugin;
