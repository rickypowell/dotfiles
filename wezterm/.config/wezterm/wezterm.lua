-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "Catppuccin Mocha"

config.use_fancy_tab_bar = false
config.enable_tab_bar = false

config.front_end = "WebGpu"

config.max_fps = 60

--
-- Cursor
--
config.default_cursor_style = "BlinkingBar"
config.cursor_thickness = "1pt"

--
-- Window
--

config.window_padding = {
  left = 24,
  right = 24,
  top = 24,
  bottom = 24,
}

-- config.window_background_opacity = 0.9
config.macos_window_background_blur = 60

-- Update the path as needed
config.window_background_image = "/Users/" .. os.getenv("USER") .. "/Pictures/wezterm/background.jpeg"
config.window_background_image_hsb = {
  brightness = 0.1,                    -- Adjust brightness (0.0 - 1.0)
  hue = 1.0,                           -- Adjust hue (0.0 - 1.0)
  saturation = 1.0,                    -- Adjust saturation (0.0 - 1.0)
}
config.window_background_opacity = 0.8 -- Opacity of the window background (0.0 - 1.0)


--
-- Font
--

config.font = wezterm.font_with_fallback {
  { family = "BlexMono NF", weight = "Medium" },
  "Apple Color Emoji",
  "Fira Code",
  "Noto Color Emoji",
}

-- and finally, return the configuration to wezterm
return config
