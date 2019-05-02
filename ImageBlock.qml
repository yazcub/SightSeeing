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
    property string histdesc
    property string typtext
    property string factext
    property alias rootstate: root.state
    property int sourceX
    property int sourceY


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
        mirror: true
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
            anchors.leftMargin: 15
            spacing: 20
            Text {
                id: _header
                text: header
                color: "#fff"
                font.pixelSize: 22
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

        z:30
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
            spacing: 10
            Text {
                id: _openedtitle
                text: "opened"
                color: "#000"
                font.pixelSize: 15
                font.family: Constants.fontComfortaaRegularFamily
                font.bold: true
            }

            Text {
                id: _openedtext
                text: histdesc
                color: "#000"
                font.pixelSize: 20
                font.family: Constants.fontComfortaaRegularFamily
            }

            Text {
                text: ""
                font.pixelSize: 15
            }

            Text {
                id: typ
                text: "type"
                color: "#000"
                font.pixelSize: 15
                font.family: Constants.fontComfortaaRegularFamily
                font.bold: true
            }

            Text {
                id: typetext
                text: typtext
                color: "#000"
                font.pixelSize: 20
                font.family: Constants.fontComfortaaRegularFamily
            }
        }
        z:20
    }

    Rectangle {
        id: _facts
        y: 600
        width: parent.width
        height: 200
        color: "transparent"
        visible: false
        opacity: 0
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
                text: factext

                color: "#fff"
                font.pixelSize: 11
                font.family: Constants.fontSignikaRegularFamily
            }
        }

    }

//    Component.onCompleted: {

//        if (roo)
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
                y:0
                x:0
            }

            PropertyChanges {
                target: _pict1
                height: 200
                y:0
                x:0
                z:99
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
                target: _facts
                x: 0
                y: 400
                visible: true
                opacity:1
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
            NumberAnimation {
                properties: "width, height"
                easing.type: Easing.OutExpo
                duration: 1000
            }



            NumberAnimation {
//                target: description_block
                property: "opacity"
                duration: 700
                easing.type: Easing.InOutQuad
            }

            SequentialAnimation {
                NumberAnimation {
                    target: selectblock
                    property: "x,y"
                    duration: 200
                    easing.type: Easing.OutBack
                    from: sourceY

                }

                NumberAnimation {
                    target: description_block
                    properties: "x"
                    duration: 700
                    easing.type: Easing.OutExpo
//                    from: sourceX
                }
            }


            NumberAnimation {
                target: _pict1
                property: "y"
                from:100
                to: 0
                duration: 600
                easing.type: Easing.OutExpo
            }

            NumberAnimation {
                target: _facts
                property: "y"
                from:600
                to: 400
                duration: 2000
                easing.type: Easing.OutExpo
            }
        }
    ]
}
