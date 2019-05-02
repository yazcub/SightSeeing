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
        typtext: "Mosque"
        histdesc: "1453"
        factext: "The Hagia Sophia, one of the historical architectural wonders that still remains standing today, has an important place in the art world with its architecture, grandness, size and functionality."
        sourceX: 0
        sourceY: 0

        z: 10

        MouseArea {
            anchors.fill: parent
            onClicked: {
                hideToolbar()
                imageBlock.rootstate="showpage"
                imageBlock2.rootstate="goaway"
            }

        }
    }

    ImageBlock {
        id: imageBlock2
        width: parent.width / 1.2
        height: parent.height / 3
        imagesource: "images/kizkulesi.png"
        position: 1
        anchors.top: parent.top
        anchors.topMargin: 290
        anchors.horizontalCenter: parent.horizontalCenter
        blockcolor: "#218be5"
        header: "Kiz Kulesi"
        description: "Üsküdar, Istanbul"
        typtext: "Tower"
        histdesc: "1110"
        factext: "The Maiden's Tower (Turkish: Kız Kulesi), also known as Leander's Tower (Tower of Leandros) since the medieval Byzantine period, is a tower lying on a small islet located at the southern entrance of the Bosphorus strait 200 m (220 yd) from the coast of Üsküdar in Istanbul, Turkey."
        sourceX: 0
        sourceY: 0

        z: 10

        MouseArea {
            anchors.fill: parent
            onClicked: {
                hideToolbar()
                imageBlock2.anchors.topMargin=50
                imageBlock2.rootstate="showpage"
                imageBlock.rootstate="goaway"
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
