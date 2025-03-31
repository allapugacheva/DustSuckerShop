import QtQuick
import QtQuick.Controls
import Qt5Compat.GraphicalEffects
import "."

Popup {

    id: window
    modal: true
    width: 450
    height: (width * 5) / 6

    Style { id: style }

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

    function isValidEmail(email) {
        var emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
        return emailPattern.test(email);
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
            text: "Email:"
            font.family: style.fontFamily
            anchors.horizontalCenter: parent.horizontalCenter
            leftPadding: parent.width * 0.01
        }

        Rectangle {
            width: parent.width / 1.5
            height: parent.height / 8.5
            anchors.horizontalCenter: parent.horizontalCenter

            TextInput {
                id: emailTI
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
                id: passwordTI
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

                onClicked: {

                    if (passwordTI.text.length < 8)
                        passErr.open()
                    else if (!isValidEmail(emailTI.text))
                        emailErr.open()
                    else if (GlobalData.isLogged)
                        loginErr.open()
                    else {
                        var request = new XMLHttpRequest()
                        request.open("POST", "http://dustsucker.tonitrusbn.ru/api/Auth/login")
                        request.setRequestHeader("Content-Type", "application/json")

                        request.onreadystatechange = function() {
                            if (request.readyState === XMLHttpRequest.DONE) {

                                GlobalData.userEmail = emailTI.text
                                GlobalData.isLogged = true

                                success.open()

                                window.close()
                            }
                        }

                        var requestBody = {
                            "email": emailTI.text,
                            "password": passwordTI.text
                        }

                        request.send(JSON.stringify(requestBody))
                    }
                }
            }

            OrangeButton {
                height: parent.height
                width: parent.width / 2.1
                text: "Регистрация"
                font.pointSize: parent.height / 3

                onClicked: {

                    if (passwordTI.text.length < 8)
                        passErr.open()
                    else if (!isValidEmail(emailTI.text))
                        emailErr.open()
                    else if (GlobalData.isLogged)
                        loginErr.open()
                    else {
                        var request = new XMLHttpRequest()
                        request.open("POST", "http://dustsucker.tonitrusbn.ru/api/Auth/register")
                        request.setRequestHeader("Content-Type", "application/json")

                        request.onreadystatechange = function() {
                            if (request.readyState === XMLHttpRequest.DONE) {

                                GlobalData.userEmail = emailTI.text
                                GlobalData.isLogged = true

                                success.open()

                                window.close()
                            }
                        }

                        var requestBody = {
                            "fullName": "fuck",
                            "username": "fuck",
                            "password": passwordTI.text,
                            "email": emailTI.text,
                            "phoneNumber": "fuck"
                        }

                        request.send(JSON.stringify(requestBody))
                    }
                }
            }

            Dialog {
                id: passErr
                title: "Ошибка"
                modal: true
                standardButtons: Dialog.Ok

                implicitWidth: 300
                implicitHeight: 150

                anchors.centerIn: window

                contentItem: Text {
                    text: "Пароль меньше 8 символов!!!"
                    font.pixelSize: 16
                    horizontalAlignment: Text.AlignHCenter
                }
            }

            Dialog {
                id: emailErr
                title: "Ошибка"
                modal: true
                standardButtons: Dialog.Ok

                implicitWidth: 300
                implicitHeight: 150

                anchors.centerIn: window

                contentItem: Text {
                    text: "Некорректный email"
                    font.pixelSize: 16
                    horizontalAlignment: Text.AlignHCenter
                }
            }

            Dialog {
                id: loginErr
                title: "Ошибка"
                modal: true
                standardButtons: Dialog.Ok

                implicitWidth: 300
                implicitHeight: 150

                anchors.centerIn: window

                contentItem: Text {
                    text: "Вход уже осуществлён"
                    font.pixelSize: 16
                    horizontalAlignment: Text.AlignHCenter
                }
            }

            Dialog {
                id: success
                title: "Успех"
                modal: true
                standardButtons: Dialog.Ok

                implicitWidth: 300
                implicitHeight: 150

                anchors.centerIn: window

                contentItem: Text {
                    text: "Вход в аккаунт осуществлён"
                    font.pixelSize: 16
                    horizontalAlignment: Text.AlignHCenter
                }
            }
        }
    }
}
