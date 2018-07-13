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
    }

    Label {
        text: qsTr("You are on Page 2.")
        anchors.centerIn: parent
        color: "white"
    }
}
