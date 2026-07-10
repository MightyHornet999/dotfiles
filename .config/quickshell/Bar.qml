// Bar.qml
import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts


// Scope allows functions to be declared outside of the modules
// and allows us to use Global(ish) variables
Scope {
  id: root
  property string time

  property color colBg: "#1a1b26"
  property color colPri: "#dd4967"
  property color colSec: "#7aa2f7"
  property color colTer: "#e0af68"
  property string fontFamily: "JetBrainsMono Nerd Font"

  property int cpuUsage: 0
  property var lastCpuIdle: 0
  property var lastCpuTotal: 0

  Variants {
    model: Quickshell.screens

    PanelWindow {

      required property var modelData
      screen: modelData

      anchors {
        top: true
        left: true
        right: true
      }
      implicitHeight: 30
      color: "#1a1b26"

      
      // Add widgets here
      RowLayout {
        anchors.fill: parent
        anchors.margins: 8
        
        // Repeaters are like for loops
        Repeater {
          model: 6  // The number of loops
                    // use <index> to call the current number
          Text {
            // Including Hyprland data
            property var ws: Hyprland.workspaces.values.find(w => w.id === index + 1)
            property bool isActive: Hyprland.focusedWorkspace?.id === (index + 1)

            text: index + 1
            // Active => Has windows => Empty 
            color: isActive ? root.colPri : (ws ? root.colSec : "#444b6a")
            font { pixelSize: 14; bold: true }

            MouseArea {
              anchors.fill: parent
              onClicked: Hyprland.dispatch("hl.dsp.focus({ workspace = " + (index + 1) + "})")
            }
          }
        }
        Item { Layout.fillWidth: true }  
      }

      // Clock
      Text {
        anchors.centerIn: parent
        text: root.time
        color: "#a9b1d6"
      }
    
      RowLayout {
        anchors.fill: parent
        anchors.margins: 8
  
        
        Item { Layout.fillWidth: true }

        Text {
          text: "CPU: " + cpuUsage + "%"
          color: root.colTer
          font { family: root.fontFamily; pixelSize: 16; bold: true }
        }
      }

    }
  }

  Process {
    id: dateProc
    command: ["date"]
    running: true

    stdout: StdioCollector {
      onStreamFinished: root.time = this.text
    }
  }

  Timer {
    interval: 1000
    running: true
    repeat: true
    onTriggered: dateProc.running = true, cpuProc.running = true
  }

  Process {
    id: cpuProc
    command: ["sh", "-c", "head -1 /proc/stat"]

    stdout: SplitParser {
      onRead: data => {
        var p = data.trim().split(/\s+/)
        var idle = parseInt(p[4]) + parseInt(p[5])
        var total = p.slice(1,8).reduce((a, b) => a + parseInt(b), 0)
        if (lastCpuTotal > 0) {
          cpuUsage = Math.round(100 * (1- (idle - lastCpuIdle) / (total - lastCpuTotal)))
        }
        lastCpuTotal = total
        lastCpuIdle = idle
      }
    }
    Component.onCompleted: running = true
  }
}
