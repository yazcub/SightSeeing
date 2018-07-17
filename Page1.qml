import QtQuick 2.11
import QtQuick.Controls 2.4
import SightSeeing 1.0
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0

Page {
    id: page
//    width: Constants.width
//    height: Constants.height

    width: 400
    height: 600

    signal hideToolbar()

//    // Background
    LinearGradient {
        anchors.fill: parent
        start: Qt.point(0, 0)
        end: Qt.point(0, 300)
        gradient: Gradient {
            GradientStop {
                position: 0.0
                color: "#7c8496"
            }
            GradientStop {
                position: 1.0
                color: "#3c4456"
            }
        }
        z: 1
    }

    ImageBlock {
        id: imageBlock
        width: parent.width / 1.2
        height: parent.height / 3
        imagesource: "images/ayasofya.jpg"
        position: 0
        anchors.top: parent.top
        anchors.topMargin: 50
        anchors.horizontalCenter: parent.horizontalCenter
        blockcolor: "#8082ce"
        header: "Ayasofya"
        description: "Fatih, Istanbul"
        sourceX: x
        sourceY: y

        z: 10

        MouseArea {
            anchors.fill: parent
            onClicked: {
                hideToolbar()
                imageBlock.rootstate="showpage"
            }

        }
    }
    states: [
        State {
            name: "Showpage"

            PropertyChanges {
                target: imageBlock
                width: page.width
                height: page.height
                anchors.topMargin: 0
            }
        }
    ]


////    ColumnLayout {
////        anchors.fill: parent
//    ImageBlock{
//        id: button1
//        width: parent.width / 1.2
//        height: parent.height / 3
//        imagesource: "images/ayasofya.jpg"
////        Layout.alignment: Qt.AlignCenter
//        anchors.verticalCenter: parent.verticalCenter
//        position: Constants.left
//        blockcolor: "#8082ce"
//        header: "Ayasofya"
//        description: "Fatih, Istanbul"
//        MouseArea {
//            anchors.fill: parent
//            onClicked: {
//                console.log(Layout.preferredWidth)
//                console.log(Layout.preferredHeight)

//                console.log("button clicked id: " + button1.guid)
//                button2.rootstate = "goaway"
//                Layout.preferredWidth= Constants.width
//                Layout.preferredHeight= Constants.height
//                button1.rootstate = "showpage"

//                console.log(Layout.preferredWidth)
//                console.log(Layout.preferredHeight)
//            }
//        }
//    }
//    ImageBlock{
//        id: button2
//        width: parent.width / 1.2
//        height: parent.height / 3
//        imagesource: "images/kizkulesi.png"
////        Layout.alignment: Qt.AlignCenter
//        anchors.verticalCenter: parent.verticalCenter
//        position: Constants.left
//        blockcolor: "#8082ce"
//        header: "Kiz Kulesi"
//        description: "Üsküdar, Istanbul"
//        MouseArea {
//            anchors.fill: parent
//            onClicked: {
//                console.log(Layout.preferredWidth)
//                console.log(Layout.preferredHeight)

//                console.log("button clicked id: " + button1.guid)
//                button2.rootstate = "goaway"
//                Layout.preferredWidth= Constants.width
//                Layout.preferredHeight= Constants.height
//                button1.rootstate = "showpage"

//                console.log(Layout.preferredWidth)
//                console.log(Layout.preferredHeight)
//            }
//        }
//    }
//    }




}
