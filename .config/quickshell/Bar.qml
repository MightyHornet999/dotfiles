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

      RowLayout {
        anchors.fill: parent
        anchors.margins: 8
        
        // Repeaters are like for loops
        Repeater {
          model: 9  // The number of loops
                    // use <index> to call the current number
          Text {
            text: index + 1
            color: "#444b6a"
          }
      }
      
      // Clock
      Text {
        anchors.centerIn: parent
        text: root.time
        color: "#a9b1d6"
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
    onTriggered: dateProc.running = true
  }
}
}
