import QtQuick 2.11
import QtQuick.Controls 2.4
import SightSeeing 1.0
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0

Page {
    width: Constants.width
    height: Constants.height

    // Background
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

    ColumnLayout {
        anchors.fill: parent
        ImageBlock{
            id: button1
            Layout.preferredWidth: parent.width / 1.2
            Layout.preferredHeight: parent.height / 3
            imagesource: "images/ayasofya.jpg"
            Layout.alignment: Qt.AlignCenter
            position: Constants.left
            blockcolor: "#8082ce"
            header: "Ayasofya"
            description: "Fatih, Istanbul"
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    console.log(Layout.preferredWidth)
                    console.log(Layout.preferredHeight)

                    console.log("button clicked id: " + button1.guid)
                    button2.rootstate = "goaway"
                    Layout.preferredWidth= Constants.width
                    Layout.preferredHeight= Constants.height
                    button1.rootstate = "showpage"

                    console.log(Layout.preferredWidth)
                    console.log(Layout.preferredHeight)
                }
            }
        }
        ImageBlock{
            id: button2
            Layout.preferredWidth: parent.width / 1.2
            Layout.preferredHeight: parent.height / 3
            imagesource: "images/kizkulesi.png"
            Layout.alignment: Qt.AlignCenter
            position: Constants.right
            blockcolor: "#2690eb"
            header: "Kiz Kulesi"
            description: "Üsküdar, Istanbul"
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    console.log("button clicked id: " + button2.guid)
                    button1.rootstate = "goaway"
                }
            }
        }
        z: 10
    }




}
