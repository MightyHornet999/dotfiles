// Bar.qml
import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts



PanelWindow {
  id: main
  anchors { top: true; left: true; right: true }
  //exclusionMode: ExclusionMode.Ignore

  property var theme: Theme {}

  implicitHeight: 44

  color: "#00ffffff"

  mask: Region { item: island }

  Rectangle {
    id: island
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.top: parent.top
    anchors.topMargin: 8
        clip: true

    implicitWidth: ( main.screen.width * 4/5 )
    implicitHeight: 36
    radius: 6

    color: Colors.bg1


    RowLayout {

      implicitWidth: ( main.screen.width * 4/5 )
      implicitHeight: 36

      anchors.top: parent.top
      anchors.bottom: parent.bottom


      Rectangle {
        id: activeBorder

        anchors {
          top: parent.top
          topMargin: 4

          bottom: parent.bottom
          bottomMargin: 5

          left: parent.left
          leftMargin: 4

        }

        color: Colors.bg2
        property real margin: 4
        implicitWidth: activeText.implicitWidth + (amargin * 2)
        implicitHeight: 24
        radius: 6

        Text {
          id: activeText

          text: Hyprland.activeToplevel ? Hyprland.activeToplevel.title : "Desktop"

          anchors {
            top: parent.top
            topMargin: 4

            bottom: parent.bottom
            bottomMargin: 5

            left: parent.left
            leftMargin: 4
          }

          color: Colors.fg1

          font { pixelSize: 14 }
        }
      }

      // Place before for left
      Text { Layout.fillWidth: true }
      // Place after for center

 
      Rectangle {
        id: clockBorder
 
        anchors {
          top: parent.top
          topMargin: 4

          bottom: parent.bottom
          bottomMargin: 5

          horizontalCenter: parent.horizontalCenter
        }

        color: Colors.bg2

        implicitWidth: 70
        implicitHeight: 24
        radius: 6
        

        Text {
          anchors.centerIn: parent
          text: Qt.formatDateTime(clock.date, "hh:mm")
          color: Colors.fg1

          font { pixelSize: 14; bold: true }
        }

        SystemClock {
          id: clock
          precision: SystemClock.Minutes
        }
        
        // Place before for center
        Text { Layout.fillWidth: true }
        // Place after for Right
        
      }
    }
  }
}
