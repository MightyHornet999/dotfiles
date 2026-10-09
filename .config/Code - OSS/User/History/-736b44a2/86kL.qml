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

    color: theme.bg1

    RowLayout {
      implicitWidth: ( main.screen.width * 4/5 )
      implicitHeight: 36

      anchors.fill: parent
      
      // Left
      Item { 
        id: leftItem

        Layout.fillWidth: true
        Layout.fillHeight: true
        Layout.maximumWidth: parent.width / 2 - centerItem.width / 2
        //Layout.minimumWidth: parent.width / 2 - centerItem.width / 2

        Rectangle { anchors.fill: parent; color: "#f00"}
      }

      Item {
        Layout.fillWidth: true  
      }

      // Center
      Item { 
        id: centerItem

        Layout.fillHeight: true
        width: 80
        Rectangle { 
          anchors.fill: parent
          color: theme.bg2

          radius: 6
        }
      }

      Item {
          Layout.fillWidth: true
      }

      // Right
      Item { 
        id: rightItem

        Layout.fillWidth: true
        Layout.fillHeight: true
        Layout.maximumWidth: parent.width / 2 - centerItem.width / 2
        Rectangle { anchors.fill: parent; color: "#00f"}
      }

    }

  }

  
}


    /*
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

        color: theme.bg2
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

          color: theme.fg1

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

        color: theme.bg2

        implicitWidth: 70
        implicitHeight: 24
        radius: 6
        

        Text {
          anchors.centerIn: parent
          text: Qt.formatDateTime(clock.date, "hh:mm")
          color: theme.fg1

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
    }*/
