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
    property alias rootstate: root.state
    property string sourceX
    property string sourceY


//    width: parent.width
//    height: parent.height

//    opacity: 1.0

    Image {
        id: _pict1
        source: imagesource
        fillMode: Image.PreserveAspectCrop
        width: parent.width
        height: parent.height
        opacity: 0
    }

    DropShadow {
        id: dropShadow
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
        height: _pict1.height + 50
        width: _pict1.width / 1.5
        opacity: 0.93
        color: blockcolor
        x: sourceX
        y: sourceY
        anchors.verticalCenter: parent.verticalCenter

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

    Rectangle {
        id: description_block
        height: _pict1.height + 50
        width: _pict1.width / 1.5
        opacity: 0
        color: "#fff"
        anchors.verticalCenter: parent.verticalCenter

        ColumnLayout {
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 30
            spacing: 20
            Text {
                id: _opened
                text: header
                color: "#fff"
                font.pixelSize: 26
                font.family: Constants.fontComfortaaRegularFamily
                font.bold: true
            }

            Text {
                id: _total_length
                text: description
                color: "#fff"
                font.pixelSize: 13
                font.family: Constants.fontSignikaRegularFamily
            }
        }
    }

    Rectangle {
        id: _facts
        y: 600
        width: parent.width
        height: 200
        color: "transparent"
        visible: false
        ColumnLayout {
            anchors.top: parent.top
            anchors.topMargin: 30
            anchors.left: parent.left
            anchors.leftMargin: 40
            spacing: 1
            Text {
                id: _factHeader
                text: header
                color: "#fff"
                font.pixelSize: 12
                font.family: Constants.fontComfortaaRegularFamily
                font.bold: true
            }

            Text {
                id: _fact_text
                Layout.preferredWidth: 320
                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                text: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet."

                color: "#fff"
                font.pixelSize: 11
                font.family: Constants.fontSignikaRegularFamily
            }
        }

    }

//    Component.onCompleted: {
//        if (position === 0) {
//            selectblock.anchors.left = _pict1.left
//            selectblock.anchors.leftMargin = -20
//        } else {
//            selectblock.anchors.right = _pict1.right
//            selectblock.anchors.rightMargin = -20
//        }

//        console.log(_pict1.height)
//        console.log(selectblock.y)

//    }
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
            }

            PropertyChanges {
                target: root
                width: 400
                height: 600
            }

            PropertyChanges {
                target: dropShadow
                height: 200
            }

            PropertyChanges {
                target: _pict1
                height: 200
                z:99
                opacity:0
            }

            PropertyChanges {
                target: selectblock
                x: 0
                y: 199
                width:200
                height:200
            }

            PropertyChanges {
                target: description_block
                x: 200
                width: 200
                height: 200
                opacity: 1
            }

            PropertyChanges {
                target: _opened
                color: "#000000"
                text: "1987"
            }

            PropertyChanges {
                target: _total_length
                color: "#000000"
                text: "8888"
            }

            PropertyChanges {
                target: _facts
                x: 0
                y: 400
                visible: true
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
        },
        Transition {
            to: "showpage"
//            NumberAnimation {
//                properties: "width, height"
//                easing.type: Easing.OutExpo
//                duration: 1000
//            }

            NumberAnimation {
                target: description_block
                properties: "x"
                easing.type: Easing.OutExpo
                duration: 1000
            }
            NumberAnimation {
                target: selectblock
                property: "x,y"
                duration: 1000
                easing.type: Easing.OutExpo
                from: sourceY



            }

            NumberAnimation {
                target: _pict1
                property: "y"
                from:400
                to: 0
                duration: 600
                easing.type: Easing.OutExpo
            }

            OpacityAnimator {
                target: _pict1
                from:0
                to: 1
                duration: 1000
                easing.type: Easing.OutCirc
            }

            NumberAnimation {
                target: _facts
                property: "y"
                from:600
                to: 400
                duration: 1200
                easing.type: Easing.OutExpo
            }


        }
    ]
}
