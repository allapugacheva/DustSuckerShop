import QtQuick
import QtQuick.Controls
import Qt5Compat.GraphicalEffects

Rectangle {

    id: root

    Style { id: style }

    property var borderWidth: (parent.height / 50 > 0) ? 1 : parent.height / 50

    Loader {
        id: dialogLoader
        source: ""
    }

    Rectangle {
        width: parent.width
        height: borderWidth
        color: style.divisorColor
        anchors.bottom: parent.bottom

        layer.enabled: true
        layer.effect: DropShadow {
            transparentBorder: true
            color: style.borderColor
            samples: 20
        }
    }

    Row {
        width: parent.width
        height: parent.height
        spacing: parent.width * 0.01
        padding: parent.height * 0.05

        Image {
            height: parent.height - parent.height * 0.2
            fillMode: Image.PreserveAspectFit
            source: "file:///D:/DustSuckerShop/images/DSLogo.png"
        }

        Image {
            height: parent.height - parent.height * 0.2
            fillMode: Image.PreserveAspectFit
            source: "file:///D:/DustSuckerShop/images/TitleDS.png"
        }

        Item {
            width: parent.width * 0.07
            height: borderWidth
        }

        Rectangle {
            width: parent.width * 0.6 - parent.height * 0.1
            height: parent.height - parent.height * 0.2
            border.color: style.borderColor
            border.width: borderWidth
            radius: parent.height * 0.1

            TextInput {
                id: textEdit
                height: parent.height
                width: parent.width
                font.family: style.fontFamily
                font.pointSize: parent.height / 3
                leftPadding: parent.height * 0.1
                verticalAlignment: Text.AlignVCenter

                property string placeholderText: "Поиск..."

                Text {
                    anchors.fill: parent
                    text: textEdit.placeholderText
                    color: style.divisorColor
                    visible: !textEdit.text
                    verticalAlignment: Text.AlignVCenter
                    font.family: style.fontFamily
                    leftPadding: parent.height * 0.1
                }
            }
        }

        Image {
            height: parent.height - parent.height * 0.3
            width: parent.height - parent.height * 0.3
            source: "file:///D:/DustSuckerShop/images/find.png"
        }

        Item {
            width: parent.width * 0.02
            height: borderWidth
        }

        Rectangle {
            height: parent.height - parent.height * 0.2
            width: parent.height - parent.height * 0.2
            border.width: borderWidth
            border.color: style.borderColor
            radius: parent.height * 0.1

            Image {
                anchors.centerIn: parent
                height: parent.height * 0.9
                width: parent.height * 0.9
                source: "file:///D:/DustSuckerShop/images/izbr.png"
            }
        }

        Rectangle {
            height: parent.height - parent.height * 0.2
            width: parent.height - parent.height * 0.2
            border.width: borderWidth
            border.color: style.borderColor
            radius: parent.height * 0.1

            Image {
                anchors.centerIn: parent
                height: parent.height * 0.9
                width: parent.height * 0.9
                source: "file:///D:/DustSuckerShop/images/profile.png"
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    console.log("clicked")
                    dialogLoader.source = "RegistrationWindow.qml"
                    dialogLoader.item.open()
                }
            }
        }

        Rectangle {
            height: parent.height - parent.height * 0.2
            width: parent.height - parent.height * 0.2
            border.width: borderWidth
            border.color: style.borderColor
            radius: parent.height * 0.1

            Image {
                anchors.centerIn: parent
                height: parent.height * 0.9
                width: parent.height * 0.9
                source: "file:///D:/DustSuckerShop/images/korzina.png"
            }
        }
    }
}
