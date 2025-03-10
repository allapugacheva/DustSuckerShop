import QtQuick
import "."

Rectangle {

    Style { id: style }

    border.color: style.borderColor
    border.width: parent.width * 0.002
    radius: parent.width * 0.01

    TextInput {
        anchors.fill: parent
        wrapMode: Text.Wrap
        font.family: style.fontFamily
        font.pointSize: parent.height * 0.5
        anchors.margins: parent.width * 0.01
        clip: true
    }
}
