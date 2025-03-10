import QtQuick
import QtQuick.Controls
import Qt5Compat.GraphicalEffects
import "."

Rectangle {

    width: 200
    height: width / 2

    Style { id: style }

    property double cost: 1234.56

    border.color: style.borderColor
    border.width: height * 0.007
    radius: width * 0.05

    layer.enabled: true
    layer.effect: DropShadow {
        transparentBorder: true
        color: style.borderColor
        samples: 20
    }

    Column {
        width: parent.width
        height: parent.height
        spacing: parent.width * 0.012
        padding: parent.width * 0.02

        Text {
            width: parent.width
            height: parent.height * 0.25
            text: "Ваш заказ"
            font.family: style.fontFamily
            font.pointSize: parent.width * 0.1
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }

        Text {
            width: parent.width
            height: parent.height * 0.25
            text: "Итого: " + cost + " р."
            font.family: style.fontFamily
            font.pointSize: parent.width * 0.05
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }

        OrangeButton {
            width: parent.width * 0.5
            height: parent.height * 0.3
            text: "Оформить"
            font.pointSize: parent.width * 0.05
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}
