---
name: using-xcodebuildmcp
description: "Build, test, run, debug, and automate iOS/macOS/watchOS/tvOS/visionOS apps via XcodeBuildMCP. Use when working on Xcode projects, simulators, devices, or Swift packages."
---

# XcodeBuildMCP

Prefer XcodeBuildMCP MCP tools over raw `xcodebuild`, `xcrun`, or `simctl`.

If a capability is missing, use the `manage-workflows` tool to enable additional workflow groups. By default only simulator tools are enabled.

## Session Defaults

Before calling any other tools, call `session_show_defaults` to check the current defaults, then fill in any missing values. Use discovery/list tools first to obtain valid values.

- `session_show_defaults` — Show current active defaults.
- `session_set_defaults` — Set defaults for the active profile.
- `session_clear_defaults` — Clear defaults for the active profile.
- `session_use_defaults_profile` — Switch the active defaults profile.
- `sync_xcode_defaults` — Sync defaults from Xcode's current IDE selection.

## Default Tool Choice (Simulator)

- If intent includes run/launch/open in Simulator → use `build_run_sim`.
- If intent is compile-only (no launch) → use `build_sim`.
- Do NOT chain `build_sim` then `build_run_sim` unless the user explicitly asks for both.
- If app is already built and only needs launch → use `install_app_sim` + `launch_app_sim` (or `launch_app_logs_sim`).

## Project Discovery

- `discover_projs` — Find .xcodeproj and .xcworkspace files.
- `list_schemes` — List Xcode schemes.
- `show_build_settings` — Show build settings.
- `get_app_bundle_id` — Extract bundle id from .app.
- `get_mac_bundle_id` — Extract bundle id from macOS .app.

## Simulator

- `list_sims` / `boot_sim` / `open_sim` — Manage simulators.
- `build_sim` — Build for iOS simulator (compile-only).
- `build_run_sim` — Build and run on iOS simulator (preferred for run intent).
- `test_sim` — Test on iOS simulator.
- `install_app_sim` / `launch_app_sim` / `launch_app_logs_sim` / `stop_app_sim` — App lifecycle.
- `get_sim_app_path` — Get simulator built app path.
- `record_sim_video` — Record simulator video.

## Simulator Management

- `erase_sims` / `set_sim_location` / `reset_sim_location` / `set_sim_appearance` / `sim_statusbar`

## Device

- `list_devices` — List connected devices.
- `build_device` / `test_device` — Build and test for device.
- `install_app_device` / `launch_app_device` / `stop_app_device` — App lifecycle.
- `get_device_app_path` — Get device built app path.

## macOS

- `build_macos` / `build_run_macos` / `test_macos` — Build, run, and test.
- `launch_mac_app` / `stop_mac_app` — App lifecycle.
- `get_mac_app_path` — Get macOS built app path.

## Logging

- `start_sim_log_cap` / `stop_sim_log_cap` — Simulator log capture.
- `start_device_log_cap` / `stop_device_log_cap` — Device log capture.

## Debugging

- `debug_attach_sim` — Attach LLDB to simulator app.
- `debug_breakpoint_add` / `debug_breakpoint_remove` — Manage breakpoints.
- `debug_continue` / `debug_detach` — Control execution.
- `debug_lldb_command` — Run arbitrary LLDB command.
- `debug_stack` / `debug_variables` — Inspect state.

## UI Automation

- `screenshot` — Capture screenshot.
- `snapshot_ui` — Print view hierarchy with element ids/labels and coordinates.
- `tap` — Tap by accessibility id/label (recommended) or coordinates.
- `type_text` — Type text into focused element.
- `swipe` / `long_press` / `touch` — Gesture input.
- `button` / `gesture` / `key_press` / `key_sequence` — Hardware button and key input.

## Swift Packages

- `swift_package_build` / `swift_package_test` / `swift_package_run` — Build, test, run.
- `swift_package_clean` / `swift_package_list` / `swift_package_stop` — Manage.

## Scaffolding & Utilities

- `scaffold_ios_project` / `scaffold_macos_project` — Create new projects from templates.
- `clean` — Clean build products.
- `doctor` — MCP environment diagnostics.
- `manage-workflows` — Enable/disable tool workflow groups.
