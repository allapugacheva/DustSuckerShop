import QtQuick
import QtQuick.Controls
import Qt5Compat.GraphicalEffects

Rectangle {

    id: root
    width: 200
    height: width / 25

    Style { id: style }

    property var borderWidth: (parent.height / 50 > 0) ? 1 : parent.height / 50

    property var regWinX
    property var regWinY

    property var findText: textEdit.text

    signal findClicked()

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

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (stackView.currentItem.objectName !== "MainWindow")
                        stackView.replace("MainWindow.qml")
                }
            }
        }

        Image {
            height: parent.height - parent.height * 0.2
            fillMode: Image.PreserveAspectFit
            source: "file:///D:/DustSuckerShop/images/TitleDS.png"

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (stackView.currentItem.objectName !== "MainWindow")
                        stackView.replace("MainWindow.qml")
                }
            }
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

                onTextChanged: {
                    if (text.length === 0) {
                        root.findText = ""
                        findClicked()
                    }
                }

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

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    console.log(textEdit.text)

                    if (stackView.currentItem.objectName !== "MainWindow")
                        stackView.replace("MainWindow.qml", { findTxt: textEdit.text })
                    else {
                        root.findText = textEdit.text
                        findClicked()
                    }
                }
            }
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
                source: "file:///D:/DustSuckerShop/images/plus.png"
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (stackView.currentItem.objectName !== "AddHooverWindow")
                        stackView.replace("AddHooverWindow.qml")
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
                source: "file:///D:/DustSuckerShop/images/profile.png"
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    dialogLoader.source = "RegistrationWindow.qml"
                    dialogLoader.item.open()
                    dialogLoader.item.x = regWinX
                    dialogLoader.item.y = regWinY
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

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (stackView.currentItem.objectName !== "CartWindow" && GlobalData.isLogged)
                        stackView.replace("CartWindow.qml")
                    else if (!GlobalData.isLogged)
                        loginErr.open()
                }
            }
        }

        Dialog {
            id: loginErr
            title: "Ошибка"
            modal: true
            standardButtons: Dialog.Ok

            implicitWidth: 300
            implicitHeight: 150

            x: regWinX
            y: regWinY

            contentItem: Text {
                text: "Не выполнен вход в аккаунт"
                font.pixelSize: 16
                horizontalAlignment: Text.AlignHCenter
            }
        }
    }
}
