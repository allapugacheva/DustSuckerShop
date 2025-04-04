import QtQuick
import QtQuick.Controls
import Qt5Compat.GraphicalEffects
import "."

Rectangle {

    width: 80
    height: 100
    Style { id: style }
    property real hoverFactor: 1

    property int stars: 3
    property string name: "Сосунец 228"
    property string price: "666,00 р."
    property string imageSrc: "file:///D:/DustSuckerShop/images/dust.png"

    id: root
    border.color: style.borderColor
    border.width: width * 0.005
    radius: width * 0.05
    z: 0

    transform: Scale {
        origin.x: 100
        origin.y: 175
        xScale: hoverFactor
        yScale: hoverFactor
    }

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onEntered: {
            parent.z = 1
            hoverFactor = 1.05;
        }
        onExited: {
            parent.z = 0
            hoverFactor = 1;
        }
    }

    layer.enabled: true
    layer.effect: DropShadow {
        transparentBorder: true
        color: hoverFactor == 1 ? style.borderColor : style.darkColor
        samples: 20
    }

    Column {
        width: parent.width
        height: parent.height
        spacing: parent.width / 17
        padding: parent.width / 17
        anchors.centerIn: parent

        Rectangle {
            width: parent.width - parent.width / 10
            height: parent.width - parent.width / 10
            anchors.horizontalCenter: parent.horizontalCenter
            border.color: style.borderColor
            border.width: parent.width * 0.005
            radius: parent.width * 0.05

            Image {
                source: imageSrc
                anchors.fill: parent
                anchors.margins: parent.width / 40
            }
        }

        Row {
            spacing: 5
            height: parent.height / 16
            anchors.horizontalCenter: parent.horizontalCenter

            Repeater {
                model: stars
                Star {
                    width: root.width / 8.5
                    height: root.width / 8.5
                }
            }
            Repeater {
                model: 5 - stars
                Star {
                    width: root.width / 8.5
                    height: root.width / 8.5
                    fillStar: false
                }
            }
        }

        Text {
            height: parent.height / 8
            width: parent.width - parent.width / 10
            text: name
            font.family: style.fontFamily
            font.pointSize: parent.width / 17
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
            wrapMode: Text.Wrap
        }

        OrangeButton {
            height: parent.height / 11
            width: parent.width / 1.5
            text: price
            font.pointSize: parent.width / 17
            font.bold: true
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}
