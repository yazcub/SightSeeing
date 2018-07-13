import QtQuick 2.11
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.3
import SightSeeing 1.0

Item {
    id: root
    property string guid: Constants.guid()
    property string imagesource
    property int position
    property string blockcolor
    property string header
    property string description
    //    property int vposition
    property alias rootstate: root.state

    opacity: 1.0

    Image {
        id: _pict1
        source: imagesource
        fillMode: Image.PreserveAspectCrop
        width: parent.width
        height: parent.height
    }

    DropShadow {
        anchors.fill: _pict1
        horizontalOffset: 5
        verticalOffset: 5
        radius: 8.0
        samples: 17
        color: "#80000000"
        source: _pict1
    }

    Rectangle {
        id: selectblock
        width: parent.width / 1.5
        height: parent.width / 1.5
        anchors.verticalCenter: _pict1.verticalCenter
        opacity: 0.93
        color: blockcolor

        ColumnLayout {
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 30
            spacing: 20
            Text {
                id: _header
                text: header
                color: "#fff"
                font.pixelSize: 26
                font.family: Constants.fontComfortaaRegularFamily
                font.bold: true
            }

            Text {
                id: _description
                text: description
                color: "#fff"
                font.pixelSize: 13
                font.family: Constants.fontSignikaRegularFamily
            }
        }
    }

    Component.onCompleted: {
        if (position === 0) {
            selectblock.anchors.left = _pict1.left
            selectblock.anchors.leftMargin = -20
        } else {
            selectblock.anchors.right = _pict1.right
            selectblock.anchors.rightMargin = -20
        }

        console.log(_pict1.height)
        console.log(selectblock.y)

    }
    states: [
        State {
            name: "goaway"
            PropertyChanges {
                target: root
                y: -1000
            }
            PropertyChanges {
                target: root
                opacity: 0.0
            }
        },
        State {
            name: "showpage"
            PropertyChanges {
                target: selectblock
                anchors.left: root.left
                anchors.leftMargin: 0
                anchors.bottom: _pict1.bottom
            }
        }
    ]

    transitions: [
        Transition {
            to: "goaway"
            NumberAnimation {
                properties: "y"
                easing.type: Easing.OutSine
                duration: 1000
            }
            OpacityAnimator {
                from: 1.0
                to: 0.0
                easing.type: Easing.OutQuint
                duration: 200
            }
        }
    ]
}
