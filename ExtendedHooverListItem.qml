import QtQuick
import QtQuick.Controls
import Qt5Compat.GraphicalEffects
import "."

Rectangle {

    Style { id: style }
    property real hoverFactor: 1

    property string name: "Сосунец 228"
    property string price: "666,00 р."
    property string model: "V11 Absolute"
    property string vendor: "Dyson"
    property string type: "вертикальный"
    property string bagType: "многоразовый"
    property string cleanType: "сухая"
    property string powerType: "аккумулятор"
    property int stars: 3
    property int reviews: 6
    property string imageSrc: "file:///D:/DustSuckerShop/images/dust.png"

    id: root

    height: (width / 7) * 2

    border.color: style.borderColor
    border.width: height * 0.005
    radius: height * 0.05
    z: 0

    signal buyClicked()
    signal showClicked()

    transform: Scale {
        origin.x: width / 2
        origin.y: height /2
        xScale: hoverFactor
        yScale: hoverFactor
    }

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onEntered: {
            parent.z = 1
            hoverFactor = 1.02;
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
                source: imageSrc
                width: parent.height * 0.9
                height: parent.height * 0.9
                anchors.centerIn: parent

                MouseArea {
                    anchors.fill: parent

                    onClicked: showClicked()
                }
            }
        }

        Column {
            width: parent.width - parent.height
            height: parent.height
            spacing: parent.height * 0.05
            topPadding: parent.height * 0.01

            Text {
                width: parent.width
                height: parent.height / 10
                text: name
                font.family: style.fontFamily
                font.pointSize: parent.height * 0.08
                wrapMode: Text.Wrap
            }

            Row {
                width: parent.width
                height: parent.height - parent.height / 9

                Column {
                    width: parent.width * 0.6
                    height: parent.height
                    spacing: parent.height * 0.04

                    Text {
                        width: parent.width
                        height: parent.height / 10
                        text: "Модель: " + model
                        font.family: style.fontFamily
                        font.pointSize: parent.height * 0.07
                    }

                    Text {
                        width: parent.width
                        height: parent.height / 10
                        text: "Производитель: " + vendor
                        font.family: style.fontFamily
                        font.pointSize: parent.height * 0.07
                    }

                    Text {
                        width: parent.width
                        height: parent.height / 10
                        text: "Тип: " + type
                        font.family: style.fontFamily
                        font.pointSize: parent.height * 0.07
                    }

                    Text {
                        width: parent.width
                        height: parent.height / 10
                        text: "Тип питания: " + powerType
                        font.family: style.fontFamily
                        font.pointSize: parent.height * 0.07
                    }

                    Text {
                        width: parent.width
                        height: parent.height / 10
                        text: "Тип уборки: " + cleanType
                        font.family: style.fontFamily
                        font.pointSize: parent.height * 0.07
                    }
                }

                Column {
                    width: parent.width / 3
                    height: parent.height
                    spacing: parent.height * 0.02
                    padding: parent.height * 0.01

                    Row {
                        width: parent.width
                        height: parent.width / 5
                        spacing: parent.width * 0.03

                        Repeater {
                            model: stars

                            Star {
                                width: parent.width / 5.5
                                height: parent.width / 5.5
                            }
                        }

                        Repeater {
                            model: 5 - stars

                            Star {
                                width: parent.width / 5.5
                                height: parent.width / 5.5
                                fillStar: false
                            }
                        }
                    }

                    Text {
                        width: parent.width
                        height: parent.height * 0.1
                        text: reviews + " отзывов"
                        font.family: style.fontFamily
                        font.pointSize: parent.width * 0.07
                        horizontalAlignment: Text.AlignHCenter
                    }

                    Item {
                        width: parent.width
                        height: parent.height * 0.15
                    }

                    Text {
                        width: parent.width
                        height: parent.height * 0.1
                        text: price + " р."
                        font.family: style.fontFamily
                        font.pointSize: parent.width * 0.07
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }

                    OrangeButton {
                        width: parent.width * 0.7
                        height: parent.height * 0.17
                        text: "Купить"
                        font.pointSize: parent.width * 0.07
                        anchors.horizontalCenter: parent.horizontalCenter

                        onClicked: buyClicked()
                    }
                }
            }
        }
    }
}
