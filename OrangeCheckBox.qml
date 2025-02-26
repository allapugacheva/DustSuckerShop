import QtQuick
import QtQuick.Controls
import Qt5Compat.GraphicalEffects

CheckBox {
    id: cb
    width: 200
    height: 30
    indicator: null

    Style { id: style }

    leftPadding: height
    font.pointSize: height * 0.5
    font.family: style.fontFamily

    background: Rectangle {
        width: parent.height - parent.height * 0.2
        height: parent.height - parent.height * 0.2
        border.color: style.borderColor
        color: cb.checked ? style.primaryColor : "transparent"
        radius: parent.width / 50

        Text {
            id: txt
            visible: false
            anchors.centerIn: parent
            text: "✔"
            font.pixelSize: cb.height * 0.6
        }
    }

    onCheckedChanged: {
        txt.visible = cb.checked
    }
}
