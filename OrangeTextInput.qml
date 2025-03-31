import QtQuick
import "."

Rectangle {

    Style { id: style }

    border.color: style.borderColor
    border.width: parent.width * 0.002
    radius: parent.width * 0.01

    property var text: ti.text

    TextInput {
        id: ti
        anchors.fill: parent
        wrapMode: Text.Wrap
        font.family: style.fontFamily
        font.pointSize: parent.height * 0.4
        anchors.margins: parent.width * 0.01
        clip: true
    }
}
