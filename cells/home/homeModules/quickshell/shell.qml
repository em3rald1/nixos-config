import Quickshell // for PanelWindow
import Quickshell.Io
import Quickshell.I3
import QtQuick // for Text

Scope {
  id: root

  property string time

  Variants {
    model: Quickshell.screens

    PanelWindow {
      required property var modelData
      screen: modelData

      color: "#2c2620";

      anchors {
        top: true
        left: true
        right: true
      }

      implicitHeight: 30

      Text {
        anchors.left: parent.left
        anchors.leftMargin: 10;
        anchors.verticalCenter: parent.verticalCenter
        color: "#a39a90"
        font.family: "FiraCode Nerd Font Mono"
        font.pixelSize: 14
        font.hintingPreference: Font.PreferFullHinting

        text: "cw:" + I3.focusedWorkspace.number
      }

      Text {
        anchors.horizontalCenter: parent.horizonalCenter
        anchors.verticalCenter: parent.verticalCenter
        color: "#a39a90"
        font.family: "FiraCode Nerd Font Mono"
        font.pixelSize: 14
        font.hintingPreference: Font.PreferFullHinting

        
      }


      Text {
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.verticalCenter: parent.verticalCenter
        color: "#a39a90"
        font.family: "FiraCode Nerd Font"
        font.pixelSize: 14
        font.hintingPreference: Font.PreferFullHinting

        text: root.time
      }
    }
  }

  Process {
    id: dateProc
    command: ["date", "+%r"]
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
