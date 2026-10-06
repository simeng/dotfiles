# monitor = DP-2, 2560x1440@144, 2560x0, 1

hl.monitor(
    { 
      output = "eDP-1", 
    mode = "1920x1080@144Hz", 
    position = "-1920x0", 
    scale = 1 
  })
hl.monitor({ 
    output = "HDMI-A-1", 
    mode = "2560x1440@59Hz", 
    position = "0x0", 
    scale = 1 
  })
hl.monitor({ 
    output = "DP-1", 
    mode = "2560x1440@59Hz", 
    position = "2560x0", 
    scale = 1 
  })

hl.workspace_rule({
    workspace = "1", 
    monitor = "HDMI-A-1", 
    persistent = true 
  })
  hl.workspace_rule({ 
    workspace = "2", 
    monitor = "DP-1", 
    persistent = true 
  })


hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("AQ_DRM_DEVICES", "/dev/dri/card0:/dev/dri/card5:/dev/dri/card1:/dev/dri/card2")

-- Trigger when lid closes (switch on)
hl.bind("switch:on:Lid Switch", hl.dsp.exec_cmd('hyprctl keyword monitor "eDP-1, disable"'), { locked = true })

-- Trigger when lid opens (switch off)
hl.bind("switch:off:Lid Switch", function()
    hl.dispatch(hl.dsp.exec_cmd('hyprctl keyword monitor "eDP-1, 1920x1080@144Hz, -1920x0, 1"'))
    hl.dispatch(hl.dsp.exec_cmd('~/Bilete/Bakgrunner/random_bg.sh'))
end, { locked = true })

hl.config({
  cursor = {
  no_hardware_cursors = true
  }
})
