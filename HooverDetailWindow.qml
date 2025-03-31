import QtQuick
import QtQuick.Controls
import "."

Item {

    id: window
    objectName: "HooverDetailWindow"

    Style { id: style }

    property var hooverId

    property var hooverTitle

    property var imagesLinks: ["file:///D:/DustSuckerShop/images/dust.png"]
    property double cost: 666.0

    property var comments: [["Алла", 5, "Хорошее качество"], ["Гриша", 2, "Не понравился"], ["Люда", 4, "Имбочка, но не на 5"]]

    property var hoover

    function getHoover() {

        var request = new XMLHttpRequest();
        var requestString = "http://dustsucker.tonitrusbn.ru/api/Hoover/" + hooverId;

        request.open("GET", requestString);
        request.onreadystatechange = function() {
            if (request.readyState === XMLHttpRequest.DONE && request.status === 200) {

                hoover = JSON.parse(request.responseText);
            }
        }
        request.send();
    }

    Component.onCompleted: getHoover()

    Column {
        width: parent.width
        height: parent.height

        MenuBar {
            width: parent.width
            regWinX: parent.width / 2 - 225
            regWinY: parent.height / 2 - 187.5
        }

        ScrollView {
            width: parent.width / 2
            height: parent.height * 0.9
            anchors.horizontalCenter: parent.horizontalCenter

            Column {
                id: col
                width: parent.width
                height: parent.height
                spacing: parent.width * 0.01

                Text {
                    width: parent.width
                    height: parent.height * 0.025
                    text: hoover.brand + " " + hoover.model
                    font.family: style.fontFamily
                    font.pointSize: parent.width * 0.03
                    horizontalAlignment: Text.AlignHCenter
                }

                ScrollableImage {
                    width: parent.width * 0.5
                    images: imagesLinks
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Row {
                    spacing: parent.width * 0.01
                    anchors.horizontalCenter: parent.horizontalCenter

                    Text {
                        height: col.width * 0.3 * 0.2
                        text: cost + " р."
                        font.family: style.fontFamily
                        font.pointSize: col.width * 0.03
                        verticalAlignment: Text.AlignVCenter
                    }

                    OrangeButton {
                        width: col.width * 0.3
                        height: width * 0.2
                        text: "Купить"
                        font.pointSize: col.width * 0.03

                        onClicked: {
                            if (GlobalData.isLogged) {

                                var request = new XMLHttpRequest()
                                request.open("PATCH", "http://dustsucker.tonitrusbn.ru/api/User/cart-add/" + GlobalData.userEmail + "/" + window.hooverTitle)
                                request.setRequestHeader("Content-Type", "application/json")

                                request.onreadystatechange = function() {
                                    if (request.readyState === XMLHttpRequest.DONE) {
                                        success.open()
                                    }
                                }

                                request.send()
                            } else
                                loginErr.open()
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
                                text: "Не выполнен вход в аккаунт"
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
                                text: "Товар добавлен в корзину"
                                font.pixelSize: 16
                                horizontalAlignment: Text.AlignHCenter
                            }
                        }
                    }
                }

                Rectangle {
                    color: style.borderColor
                    width: parent.width
                    height: parent.width * 0.005
                }

                Text {
                    text: "Характеристики:"
                    font.bold: true
                    font.family: style.fontFamily
                    font.pointSize: parent.width * 0.025
                }

                Text {
                    text: "Тип: " + hoover.type
                    font.family: style.fontFamily
                    font.pointSize: parent.width * 0.02
                }

                Text {
                    text: "Тип пылесборника: " + hoover.dustBagType
                    font.family: style.fontFamily
                    font.pointSize: parent.width * 0.02
                }

                Text {
                    text: "Тип уборки: " + hoover.cleaningType
                    font.family: style.fontFamily
                    font.pointSize: parent.width * 0.02
                }

                Text {
                    text: "Тип трубы: " + hoover.tubeType
                    font.family: style.fontFamily
                    font.pointSize: parent.width * 0.02
                }

                Text {
                    text: "Емкость пылесборника: " + hoover.dustBagCapacity + " л."
                    font.family: style.fontFamily
                    font.pointSize: parent.width * 0.02
                }

                Text {
                    text: "Тип фильтра: " + hoover.filterType
                    font.family: style.fontFamily
                    font.pointSize: parent.width * 0.02
                }

                Text {
                    text: "Потребляемая мощность: " + hoover.powerConsumption + " Вт."
                    font.family: style.fontFamily
                    font.pointSize: parent.width * 0.02
                    visible: hoover.powerConsumption !== 0
                }

                Text {
                    text: "Тип питания: " + hoover.powerType
                    font.family: style.fontFamily
                    font.pointSize: parent.width * 0.02
                }

                Text {
                    text: "Емкость батареи: " + hoover.batteryCapacity + " мА/ч"
                    font.family: style.fontFamily
                    font.pointSize: parent.width * 0.02
                    visible: hoover.batteryCapacity !== 0
                }

                Text {
                    text: "Жизнь батареи: " + hoover.batteryLife + " ч"
                    font.family: style.fontFamily
                    font.pointSize: parent.width * 0.02
                    visible: hoover.batteryLife !== 0
                }

                Text {
                    text: "Длина кабеля: " + hoover.cableLength + " м"
                    font.family: style.fontFamily
                    font.pointSize: parent.width * 0.02
                    visible: hoover.cableLength !== 0
                }

                Text {
                    text: "Мощность всасывания: " + hoover.suctionPower + " Дж"
                    font.family: style.fontFamily
                    font.pointSize: parent.width * 0.02
                }

                Text {
                    width: parent.width
                    text: "Насадки в комплекте: " + hoover.nozzlesIncluded.join(", ")
                    font.family: style.fontFamily
                    font.pointSize: parent.width * 0.02
                    wrapMode: Text.Wrap
                }

                Text {
                    text: "Вес: " + hoover.weight + " кг"
                    font.family: style.fontFamily
                    font.pointSize: parent.width * 0.02
                }

                Rectangle {
                    color: style.borderColor
                    width: parent.width
                    height: parent.width * 0.005
                }

                Text {
                    text: "Оставьте свой отзыв:"
                    font.family: style.fontFamily
                    font.pointSize: parent.width * 0.02
                }

                Rectangle {
                    width: parent.width
                    height: parent.height * 0.05
                    border.color: style.borderColor
                    border.width: parent.width * 0.002
                    radius: parent.width * 0.01

                    TextInput {
                        id: ti
                        width: parent.width
                        height: parent.height
                        anchors.fill: parent
                        wrapMode: Text.Wrap
                        font.family: style.fontFamily
                        font.pointSize: parent.width * 0.02
                        anchors.margins: parent.width * 0.01
                        clip: true

                        onAccepted: {

                            var pattern = /^[0-5] .*/;
                            if (pattern.test(ti.text)) {

                                var request = new XMLHttpRequest()
                                request.open("PATCH", "http://dustsucker.tonitrusbn.ru/api/Hoover/" + hooverId + "/add-reviews")
                                request.setRequestHeader("Content-Type", "application/json")

                                request.onreadystatechange = function() {
                                    if (request.readyState === XMLHttpRequest.DONE) {
                                        console.log(request.status)

                                        success2.open()
                                    }
                                }

                                var data = {
                                    "userEmail": GlobalData.userEmail,
                                    "rating": ti.text[0],
                                    "text": ti.text.substring(2)
                                };

                                request.send(JSON.stringify(data))
                            } else if (!GlobalData.isLogged)
                                errorLog.open()
                            else
                                error2.open()
                        }

                        Dialog {
                            id: success2
                            title: "Успех"
                            modal: true
                            standardButtons: Dialog.Ok

                            implicitWidth: 300
                            implicitHeight: 150

                            anchors.centerIn: window

                            contentItem: Text {
                                text: "Отзыв добавлен"
                                font.pixelSize: 16
                                horizontalAlignment: Text.AlignHCenter
                            }
                        }

                        Dialog {
                            id: error2
                            title: "Ошибка"
                            modal: true
                            standardButtons: Dialog.Ok

                            implicitWidth: 300
                            implicitHeight: 150

                            anchors.centerIn: window

                            contentItem: Text {
                                text: "Отзыв должен соответствовать виду ОЦЕНКА ТЕКСТ_ОТЗЫВА"
                                font.pixelSize: 16
                                horizontalAlignment: Text.AlignHCenter
                            }
                        }

                        Dialog {
                            id: errorLog
                            title: "Ошибка"
                            modal: true
                            standardButtons: Dialog.Ok

                            implicitWidth: 300
                            implicitHeight: 150

                            anchors.centerIn: window

                            contentItem: Text {
                                text: "Войдите чтобы оставить отзыв"
                                font.pixelSize: 16
                                horizontalAlignment: Text.AlignHCenter
                            }
                        }
                    }
                }

                Text {
                    text: "Отзывы купивших товар:"
                    font.family: style.fontFamily
                    font.pointSize: parent.width * 0.02
                }

                Repeater {
                    model: hoover.reviews

                    Comment {
                        width: parent.width
                        name: modelData.userEmail
                        stars: modelData.rating
                        review: modelData.text
                    }
                }
            }
        }
    }

}
