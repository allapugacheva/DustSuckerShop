import QtQuick
import QtQuick.Controls
import Qt5Compat.GraphicalEffects
import "."

Rectangle {

    Style { id: style }
    property real hoverFactor: 1

    property int stars: 3
    property string name: "Сосунец 228"
    property string price: "666,00 р."
    property string model: "V11 Absolute"
    property string vendor: "Dyson"
    property string type: "вертикальный"
    property string bagType: "многоразовый"
    property string cleanType: "сухая"
    property string powerType: "аккумулятор"
    property int reviews: 6

    id: root

    width: 700
    height: (width / 7) * 2

    border.color: style.borderColor
    border.width: height * 0.005
    radius: height * 0.05
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

    Row {
        width: parent.width
        height: parent.height
        anchors.fill: parent
        spacing: parent.height * 0.05
        padding: parent.height * 0.05

        Rectangle {
            width: parent.height * 0.9
            height: parent.height * 0.9

            border.width: parent.height * 0.005
            border.color: style.borderColor
            radius: parent.height * 0.05

            Image {
                source: "file:///D:/DustSuckerShop/images/dust.png"
                width: parent.height * 0.9
                height: parent.height * 0.9
                anchors.centerIn: parent
            }

            Heart {
                width: parent.width / 7
                height: parent.width / 7
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.topMargin: parent.width / 40
                anchors.rightMargin: parent.width / 40
                z: 1
            }
        }

        Column {
            width: parent.width / 2.6
            height: parent.height
            spacing: parent.height * 0.01
            topPadding: parent.height * 0.01

            Text {
                width: parent.width
                height: parent.height / 10
                text: name
                font.family: style.fontFamily
                font.pointSize: parent.height * 0.08
            }

            Item {
                width: parent.width
                height: parent.height / 9
            }

            Text {
                width: parent.width
                height: parent.height / 10
                text: "Модель: " + model
                font.family: style.fontFamily
                font.pointSize: parent.height * 0.05
            }

            Text {
                width: parent.width
                height: parent.height / 10
                text: "Производитель: " + vendor
                font.family: style.fontFamily
                font.pointSize: parent.height * 0.05
            }

            Text {
                width: parent.width
                height: parent.height / 10
                text: "Тип: " + type
                font.family: style.fontFamily
                font.pointSize: parent.height * 0.05
            }

            Text {
                width: parent.width
                height: parent.height / 10
                text: "Тип мешка: " + bagType
                font.family: style.fontFamily
                font.pointSize: parent.height * 0.05
            }

            Text {
                width: parent.width
                height: parent.height / 10
                text: "Тип уборки: " + cleanType
                font.family: style.fontFamily
                font.pointSize: parent.height * 0.05
            }

            Text {
                width: parent.width
                height: parent.height / 10
                text: "Тип питания: " + powerType
                font.family: style.fontFamily
                font.pointSize: parent.height * 0.05
            }
        }

        Column {
            width: parent.height
            height: parent.height

            Column {
                width: parent.width
                height: parent.height / 2
                spacing: parent.height * 0.02
                padding: parent.height * 0.06

                Row {
                    width: parent.width
                    height: parent.height / 3
                    spacing: parent.width * 0.03

                    Repeater {
                        model: stars

                        Star {
                            width: parent.width / 6
                            height: parent.width / 6
                        }
                    }

                    Repeater {
                        model: 5 - stars

                        Star {
                            width: parent.width / 6
                            height: parent.width / 6
                            fillStar: false
                        }
                    }
                }

                Text {
                    width: parent.width
                    height: parent.height / 3
                    text: reviews + " отзывов"
                    font.family: style.fontFamily
                    font.pointSize: parent.width * 0.05
                    horizontalAlignment: Text.AlignHCenter
                }
            }

            Row {
                width: parent.width
                height: parent.height / 2
                spacing: parent.width * 0.05
                padding: parent.height * 0.1

                Text {
                    width: parent.width / 3
                    height: parent.height / 2.5
                    text: price
                    font.family: style.fontFamily
                    font.pointSize: parent.width * 0.05
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }

                OrangeButton {
                    width: parent.width / 2
                    height: parent.height / 2.5
                    text: "Купить"
                    font.pointSize: parent.width * 0.05
                }
            }
        }
    }
}
