import QtQuick
import "."

Rectangle {

    width: 800
    height: col.implicitHeight

    Style { id: style }

    property string name: "Сосалка"
    property int stars: 3
    property string review: "имбочка"

    border.width: parent.width * 0.002
    border.color: style.borderColor
    radius: parent.width * 0.01

    Column {
        id: col
        width: parent.width
        height: parent.height
        padding: parent.width / 150

        Row {
            width: parent.width
            height: parent.width * 0.04
            spacing: width * 0.02

            Text {
                width: contentWidth
                height: parent.height
                text: name
                font.pointSize: parent.width * 0.02
                font.family: style.fontFamily
                verticalAlignment: Text.AlignVCenter
            }

            Repeater {
                model: stars
                Star {
                    width: parent.height * 0.9
                    height: parent.height * 0.9
                }
            }

            Repeater {
                model: 5 - stars
                Star {
                    width: parent.height * 0.9
                    height: parent.height * 0.9
                    fillStar: false
                }
            }
        }

        Text {
            width: parent.width
            text: review
            font.pointSize: parent.width * 0.02
            font.family: style.fontFamily
            wrapMode: Text.Wrap
        }
    }
}
