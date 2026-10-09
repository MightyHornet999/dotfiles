import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import Quickshell.Hyprland

Scope {
  id: overviewScope
  Variants {
    id: overviewVariants
    model: Quickshell.screens
    PanelWindow {
      id: root
      required property var modelData
      readonly property HyprlandMonitor monitor: Hyprland.monitorFor(root.screen)
      property bool monitorIsFocused: (Hyprland.focusedMonitor?.id == monitor?.id)
      property bool blurEnabled: Config.options.overview.effects.enableBlur
      property bool backdropEnabled: Config.options.overview.effects.enableBackdrop
      property real backdropOpacity: Math.max(0, Math.min(1, Config.options.overview.effects.backdropOpacity))
      property bool closeOnFocusLoss: Config.options.overview.closeOnFocusLoss ?? true
      screen: modelData
      visible: GlobalStates.overviewOpen
      
      color: "white"

      anchors {
        top: true
        // bottom: true
        left: true
        right: true
        
      }


    }
  }
}
