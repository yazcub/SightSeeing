import QtQuick 2.11
import QtQuick.Controls 2.4
import SightSeeing 1.0
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0

ApplicationWindow {
    id: root
    visible: true
//    width: Constants.width
//    height: Constants.height

    width: 400
    height: 600
    title: qsTr("Hello World")

    header: ToolBar {
        id: _toolbar
        contentHeight: control.implicitHeight
        background: Rectangle {
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
                color: Qt.darker("#33333333", control.enabled
                                 && (control.checked
                                     || control.highlighted) ? 1.5 : 1.0)
                opacity: enabled ? 1 : 0.3
                visible: control.down || (control.enabled
                                          && (control.checked
                                              || control.highlighted))
            }
        }
    }

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: 0

        Page1 {
            onHideToolbar: {
                _toolbar.visible = false
                swipeView.anchors.top = root.top
                swipeView.anchors.topMargin = -50
                root.header.visible = false
                root.footer.visible = false
            }
        }

        Page2 {
            onHideToolbar: {
                _toolbar.visible = false
                swipeView.anchors.top = root.top
                swipeView.anchors.topMargin = -50
                root.header.visible = false
                root.footer.visible = false
            }
        }

//        Page3 {
//            onHideToolbar: {
//                _toolbar.visible = false
//                swipeView.anchors.top = root.top
//                swipeView.anchors.topMargin = -50
//                root.header.visible = false
//                root.footer.visible = false
//            }
//        }
    }

    footer: ToolBar {
        height: 60
        background: Rectangle {
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

            background: Rectangle {
                color: "transparent"
            }
        }

        PageIndicator {
            id: indicator

            count: swipeView.count
            currentIndex: swipeView.currentIndex
            interactive: true
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter

            delegate: Rectangle {
                implicitWidth: 10
                implicitHeight: 10

                radius: width
                color: "#f1f1f1"

                opacity: index === swipeView.currentIndex ? 0.95 : pressed ? 0.7 : 0.45

                Behavior on opacity {
                    OpacityAnimator {
                        duration: 100
                    }
                }
            }

            contentItem: Row {
                spacing: indicator.spacing

                Repeater {
                    model: indicator.count
                    delegate: indicator.delegate
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

            background: Rectangle {
                color: "transparent"
            }
        }
    }
}
