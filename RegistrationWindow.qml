import QtQuick
import QtQuick.Controls
import Qt5Compat.GraphicalEffects
import "."

Dialog {

    modal: true
    width: 450
    height: (width * 5) / 6

    Style { id: style }

    x: (Screen.width - width) / 2
    y: (Screen.height - height) / 2

    background: Rectangle {
        color: "white"
        radius: width * 0.05
        border.color: style.borderColor
        border.width: width * 0.002

        layer.enabled: true
        layer.effect: DropShadow {
            transparentBorder: true
            color: style.borderColor
            samples: 20
        }
    }

    Column {
        width: parent.width
        height: parent.height
        anchors.fill: parent
        spacing: parent.height / 30
        padding: parent.width * 0.01

        Image {
            height: parent.height / 3.5
            fillMode: Image.PreserveAspectFit
            source: "file:///D:/DustSuckerShop/images/TitleDS.png"
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Text {
            width: parent.width / 1.5
            height: parent.height / 25
            text: "Телефон/email:"
            font.family: style.fontFamily
            anchors.horizontalCenter: parent.horizontalCenter
            leftPadding: parent.width * 0.01
        }

        Rectangle {
            width: parent.width / 1.5
            height: parent.height / 8.5
            anchors.horizontalCenter: parent.horizontalCenter

            TextInput {
                anchors.fill: parent
                font.family: style.fontFamily
                leftPadding: parent.width * 0.03
                verticalAlignment: Text.AlignVCenter
            }

            border.color: style.borderColor
            border.width: parent.height * 0.003
            radius: parent.height * 0.025

            layer.enabled: true
            layer.effect: DropShadow {
                transparentBorder: true
                color: style.borderColor
                samples: 5
            }
        }

        Text {
            width: parent.width / 1.5
            height: parent.height / 25
            text: "Пароль:"
            font.family: style.fontFamily
            anchors.horizontalCenter: parent.horizontalCenter
            leftPadding: parent.width * 0.01
        }

        Rectangle {
            width: parent.width / 1.5
            height: parent.height / 8.5
            anchors.horizontalCenter: parent.horizontalCenter

            TextInput {
                anchors.fill: parent
                font.family: style.fontFamily
                leftPadding: parent.width * 0.03
                verticalAlignment: Text.AlignVCenter
            }

            border.color: style.borderColor
            border.width: parent.height * 0.003
            radius: parent.height * 0.025

            layer.enabled: true
            layer.effect: DropShadow {
                transparentBorder: true
                color: style.borderColor
                samples: 5
            }
        }

        Item {
            width: parent.width
            height: parent.height / 200
        }

        Row {
            width: parent.width / 1.5
            height: parent.height / 8.5
            spacing: parent.height / 30
            anchors.horizontalCenter: parent.horizontalCenter

            OrangeButton {
                height: parent.height
                width: parent.width / 2.1
                text: "Вход"
                font.pointSize: parent.height / 3
            }

            OrangeButton {
                height: parent.height
                width: parent.width / 2.1
                text: "Регистрация"
                font.pointSize: parent.height / 3
            }
        }
    }
}
