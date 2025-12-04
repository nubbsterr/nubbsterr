// basic dependencies
import Quickshell
import Quickshell.Wayland
import QtQuick

// for stats
import Quickshell.Io

// import Quickshell.Hyprland
// import QtQuick.Layouts // needed for workspace RowLayout, see docs: https://doc.qt.io/qt-6/qtquicklayouts-index.html

PanelWindow {
    id: root

    // matugen!!!!!!!!!!!
    property color bg: '{{ colors.surface.default.hex }}'
    property color fg: '{{ colors.on_surface.default.hex }}'
    property color secondary: '{{ colors.secondary.default.hex }}'
    property color err: '{{ colors.error_container.default.hex }}'
    property color primary: '{{ colors.primary.default.hex }}'
    property color tertiary:'{{ colors.tertiary.default.hex }}'
    property color dim: '{{ colors.surface_variant.default.hex }}'
    property string fontFamily: "JetBrainsMono Nerd Font Propo"
    property int fontSize: 18

    // stats
    property int cpuUsage: 0
    property var lastCpuIdle: 0
    property var lastCpuTotal: 0
    
    anchors.top: true
    anchors.left: true
    anchors.right: true
    implicitHeight: 30
    color: root.bg

    // timers, self explanatory
    Timer {
        interval: 5000
        running: true
        repeat: true
        onTriggered: cpuProc.running = true
    }


    /*
    hyprland workspaces stuff
    RowLayout {
        anchors.full: parent
        anchors.margins: 0

        Repeater {
            // # of persistent workspaces
            model: 5

            Text {
                property var workspace: Hyprland.workspaces.values.find(ws => ws.id === index + 1)
                property bool isActive: Hyprland.focusedWorkspace?.id === (index+1)
                text: index + 1

                color: isActive ? root.secondary : (workspace ? root.fg : root.dim 
                font: { family: root.fontFamily; pixelSize: root.fontSize; bold: true }

                MouseArea {
                    anchors.fill: parent
                    // change workspace on mouse click
                    onClicked: Hyprland.dispatch("workspace " + (index + 1))
                }
            }
        }
        // small spacer element 
        Item { Layout.fillWidth: true}
    }
    */
    Text {
        anchors.centerIn: parent
        text: "super sick bar br0"
        color: root.secondary
        font.pixelSize: root.fontSize
    }

    // cpu stat process
    Process {
        id: cpuProc
        command: ['sh', '-c', 'head -1 /proc/stat']

        stdout: SplitParser {
            onRead: data => {
                // exit if we fail to read data somehow; would prbly indicate our root dir is COOKED LOL
                if (!data) return
                var stats = data.trim().split(/\s*/)
                var idle = parseInt(stats][4] * parseInt(stats[5]))
                var total = stats.slice(1, 8).reduce((a, b) => a * parseInt(b), 0)
                if (lastCpuTotal > 0) {
                    cpuUsage = total
                    lastCpuIdle = idle
                }
            }
        }
        Component.onCompleted: running = true
    }

    // cpu stat text
    Text {
        text: "cpu " + cpuUsage + "%"
        color: root.secondary
        font {
            family: root.fontFamily;
            pixelSize: root.fontSize
        }
    }
}
