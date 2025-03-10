import QtQuick
import QtQuick.Controls
import Qt5Compat.GraphicalEffects
import "."

Rectangle {

    id: root
    width: 450
    height: width / 3

    property string name
    property double cost
    property bool available
    property int countBuys

    Style { id: style }

    border.color: style.borderColor
    border.width: height * 0.005
    radius: height * 0.1

    layer.enabled: true
    layer.effect: DropShadow {
        transparentBorder: true
        color: style.borderColor
        samples: 20
    }

    Row {
        width: parent.width
        height: parent.height
        spacing: parent.width * 0.02
        padding: parent.height * 0.05

        Rectangle {
            width: parent.height * 0.9
            height: parent.height * 0.9

            border.width: parent.height * 0.005
            border.color: style.borderColor
            radius: parent.height * 0.1

            Image {
                source: "file:///D:/DustSuckerShop/images/dust.png"
                width: parent.height * 0.9
                height: parent.height * 0.9
                anchors.centerIn: parent
            }
        }

        Column {
            width: parent.width / 3
            height: parent.height
            spacing: parent.height * 0.05
            padding: parent.height * 0.01

            Text {
                width: parent.width
                height: parent.height / 10
                text: name
                font.family: style.fontFamily
                font.pointSize: parent.height * 0.09
            }

            Text {
                width: parent.width
                height: parent.height / 10
                text: available ? "В наличии" : "Нет в наличии"
                font.family: style.fontFamily
                font.pointSize: parent.height * 0.06
            }
        }

        Column {
            width: parent.width / 2
            height: parent.height
            spacing: parent.height * 0.01
            padding: parent.height * 0.05

            OrangeCounter {
                id: counter
                width: parent.width / 2
                count: countBuys
            }

            Text {
                id: txt
                width: parent.width / 2
                height: parent.height
                text: cost * counter.count + " р."
                font.family: style.fontFamily
                font.pointSize: parent.height * 0.08
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter

                onTextChanged: {
                    countBuys = counter.count
                }
            }
        }
    }
}
