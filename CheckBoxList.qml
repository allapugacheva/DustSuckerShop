import QtQuick
import QtQuick.Controls
import Qt5Compat.GraphicalEffects

Rectangle {
    // width: 200
    height: (paramList.length + 1) * (width / 8) + (paramList.length + 2) * (width / 24)

    Style { id: style }

    border.width: width * 0.005
    border.color: style.borderColor
    radius: width * 0.05

    property string param: ""
    property var paramList: []

    layer.enabled: true
    layer.effect: DropShadow {
        transparentBorder: true
        color: style.borderColor
        samples: 20
    }

    Column {
        id: col
        width: parent.width
        height: parent.height
        spacing: parent.width / 24
        padding: parent.width / 24
        anchors.centerIn: parent

        Text {
            text: param
            font.family: style.fontFamily
            font.pointSize: parent.width / 14
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Repeater {
            model: paramList

            OrangeCheckBox {
                width: col.width
                height: col.width / 8
                text: modelData
            }
        }
    }
}
