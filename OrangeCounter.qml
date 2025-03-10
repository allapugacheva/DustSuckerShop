import QtQuick
import QtQuick.Controls
import Qt5Compat.GraphicalEffects
import "."

Rectangle {

    id: root
    width: 100
    height: (3 * width) / 10

    Style { id: style }

    property int count

    border.color: style.borderColor
    border.width: width * 0.005
    radius: width * 0.1

    layer.enabled: true
    layer.effect: DropShadow {
        transparentBorder: true
        color: style.borderColor
        samples: 5
    }

    Row {
        width: parent.width
        height: parent.height
        leftPadding: parent.width * 0.04
        topPadding: parent.width * 0.01
        spacing: parent.width * 0.01

        Button {
            width: parent.width / 5
            height: parent.height

            contentItem: Text {
                text: "-"
                font.bold: true
                color: style.primaryColor
                font.family: style.fontFamily
                font.pointSize: root.width * 0.25
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }

            background: Rectangle {
                color: "transparent"
            }

            onClicked: {
                if (count > 1) {
                    count--;
                }
            }
        }

        Text {
            width: parent.width / 2
            height: parent.height
            text: count
            font.family: style.fontFamily
            font.pointSize: parent.width * 0.1
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }

        Button {
            width: parent.width / 5
            height: parent.height

            contentItem: Text {
                text: "+"
                font.bold: true
                color: style.primaryColor
                font.family: style.fontFamily
                font.pointSize: root.width * 0.25
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }

            background: Rectangle {
                color: "transparent"
            }

            onClicked: {
                count++;
            }
        }
    }
}
