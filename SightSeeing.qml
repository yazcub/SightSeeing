import QtQuick 2.11
import QtQuick.Controls 2.4
import SightSeeing 1.0
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0

ApplicationWindow {
    visible: true
    width: Constants.width
    height: Constants.height
    title: qsTr("Hello World")

    LinearGradient {
        anchors.fill: parent
        start: Qt.point(0, 0)
        end: Qt.point(0, 300)
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#7c8496" }
            GradientStop { position: 1.0; color: "#3c4456" }
        }
    }

    header: ToolBar {
        contentHeight: control.implicitHeight
        background: Rectangle{
            color: "#5d6375"
        }

        Label {
            text: "Top attractions"
            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 20
            font.family: Constants.fontTextFamily
            font.bold: true
            color: "#fff"
        }

        ToolButton {
            id: control
            text: "\uf0c9"
            anchors.right: parent.right
            anchors.rightMargin: 10

            contentItem: Text {
                text: control.text
                color: "#fff"
                font.family: Constants.fontRegularFamily
                font.pixelSize: Qt.application.font.pixelSize * 2.5
            }

            background: Rectangle {
                implicitWidth: 40
                implicitHeight: 40
                color: Qt.darker("#33333333", control.enabled && (control.checked || control.highlighted) ? 1.5 : 1.0)
                opacity: enabled ? 1 : 0.3
                visible: control.down || (control.enabled && (control.checked || control.highlighted))
            }
        }
    }

    footer: ToolBar{
        height: 60
        background: Rectangle{
            color: "#262d3b"
        }

        ToolButton {
            id: _entry1
            font.family: Constants.fontRegularFamily
            text: "All cities"
            anchors.leftMargin: 20
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter

            contentItem: Text {
                text: _entry1.text
                color: "#fff"
                font.pixelSize: Qt.application.font.pixelSize * 1.5
            }

            background: Rectangle{
                color: "transparent"
            }

        }

        RowLayout {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            spacing: 0
            ToolButton {
                id: _dotter1
                font.family: Constants.fontRegularFamily
                text: "\uf111"
                contentItem: Text {
                    text: _dotter1.text
                    color: "#fff"
                    font.pixelSize: Qt.application.font.pixelSize * 0.8
                }
                background: Rectangle{
                    color: "transparent"
                }

            }
            ToolButton {
                id: _dotter2
                font.family: Constants.fontSolidFamily
                text: "\uf1ce"
                font.pixelSize: Qt.application.font.pixelSize * 0.8
                contentItem: Text {
                    text: _dotter2.text
                    color: "#fff"
                    font.pixelSize: Qt.application.font.pixelSize * 0.8
                }
                background: Rectangle{
                    color: "transparent"
                }

            }
            ToolButton {
                id: _dotter3
                font.family: Constants.fontSolidFamily
                text: "\uf1ce"
                font.pixelSize: Qt.application.font.pixelSize * 0.8
                contentItem: Text {
                    text: _dotter3.text
                    color: "#fff"
                    font.pixelSize: Qt.application.font.pixelSize * 0.8
                }
                background: Rectangle{
                    color: "transparent"
                }

            }

        }

        ToolButton {
            id: _entry3
            font.family: Constants.fontRegularFamily
            text: "Next"
            anchors.right: parent.right
            anchors.rightMargin: 20
            anchors.verticalCenter: parent.verticalCenter

            contentItem: Text {
                text: _entry3.text
                color: "#fff"
                font.pixelSize: Qt.application.font.pixelSize * 1.5
            }

            background: Rectangle{
                color: "transparent"
            }

        }
    }
}
