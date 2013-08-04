import QtQuick 2.0
import Vreen.Base 2.0
import "../delegates"

Column {
    property alias model: repeater.model

    clip: true
    spacing: mm

    Repeater {
        id: repeater

        delegate: Rectangle {
            color: "black"
            width: parent.width
            height: 60
        }
    }
}
