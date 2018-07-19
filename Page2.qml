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
        imagesource: "images/Sultanahmet.jpg"
        position: 0
        anchors.top: parent.top
        anchors.topMargin: 50
        anchors.horizontalCenter: parent.horizontalCenter
        blockcolor: "#8082ce"
        header: "Sultanahmet"
        description: "Fatih, Istanbul"
        typtext: "Mosque"
        histdesc: "1616"
        factext: "The Sultan Ahmed Mosque or Sultan Ahmet Mosque (Turkish: Sultan Ahmet Camii) is a historic mosque located in Istanbul, Turkey. A popular tourist site, the Sultan Ahmed Mosque continues to function as a mosque today; men still kneel in prayer on the mosque's lush red carpet after the call to prayer. The Blue Mosque, as it is popularly known, was constructed between 1609 and 1616 during the rule of Ahmed I. "
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
        imagesource: "images/yavuzsultanselim.jpg"
        position: 1
        anchors.top: parent.top
        anchors.topMargin: 290
        anchors.horizontalCenter: parent.horizontalCenter
        blockcolor: "#218be5"
        header: "Yavuz Sultan\nSelim Köprüsü"
        description: "Bosphorus, Istanbul"
        typtext: "Bridge"
        histdesc: "2016"
        factext: "The bridge is part of the projected 260 km (160 mi) Northern Marmara Motorway (Turkish: Kuzey Marmara Otoyolu), which will bypass urban areas of Istanbul in the north connecting Kınalı, Silivri in the west and Paşaköy, Hendek in the east. The 58.4-metre-wide (192 ft) bridge is 2,164 m (7,100 ft) in length with a main span of 1,408 m (4,619 ft).[8] The main span is the ninth longest suspension bridge in the world.[9]"
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
}
