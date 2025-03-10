import QtQuick
import QtQuick.Controls
import Qt5Compat.GraphicalEffects

Rectangle {
    width: 200
    height: col.implicitHeight

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
        //height: parent.height
        spacing: parent.width * 0.01
        padding: parent.width * 0.03
        anchors.centerIn: parent

        Text {
            text: param
            font.family: style.fontFamily
            font.pointSize: parent.width * 0.06
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Repeater {
            model: paramList

            OrangeCheckBox {
                width: col.width
                height: width * 0.15
                text: modelData
            }
        }
    }
}
