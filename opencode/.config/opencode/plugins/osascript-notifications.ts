import type { Plugin } from "@opencode-ai/plugin";

/**
 * Plugin that runs an osascript (AppleScript) when the session becomes idle.
 * This is useful for macOS-specific actions like notifications, system commands, etc.
 */
export const IdleOsascriptPlugin: Plugin = async (ctx) => {
  const { $ } = ctx;

  const sessionIdle = `
    display notification "Awaiting your next instruction" with title "OpenCode" sound name "Funk"
  `;

  const permissionAsked = `display notification "Permission Required" with title "OpenCode" sound "Bonk"`;

  return {
    "session.idle": async (input, output) => {
      await $`osascript -e ${sessionIdle}`;
    },
    "permission.asked": async (input, output) => {
      await $`osascript -d ${permissionAsked}`;
    },
  };
};

export default IdleOsascriptPlugin;
