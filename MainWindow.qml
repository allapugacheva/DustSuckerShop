import QtQuick
import QtQuick.Controls
import "."

Item {

    id: window
    objectName: "MainWindow"
    property var params: ["Тип:", "Тип питания:", "Тип уборки:"]
    property var paramsValues: [["Классический", "Автомобильный", "Робот-пылесос", "Вертикальный", "Промышленный"],
                                ["Аккумулятор", "Источник питания", "Комбинированный"],
                                ["Сухая", "Моющая", "Аквафильтр"]]
    property var sortParams: ["По цене ↑", "По цене ↓"]

    property string findTxt

    property string userEmail

    property var itemsList: []

    function getHoovers(val) {
        var request = new XMLHttpRequest();
        var requestString = "http://dustsucker.tonitrusbn.ru/api/Advertisement";

        if (comboBox.currentText === "По цене ↑")
            requestString += "?sortedBy=costDescending"
        else
            requestString += "?sortedBy=costAscending"

        if (typeCB.selected.length !== 0)
            requestString += "&HooverType=" + typeCB.selected.join(", ")

        if (powerCB.selected.length !== 0)
            requestString += "&PowerType=" + powerCB.selected.join(", ")

        if (cleanCB.selected.length !== 0)
            requestString += "&CleaningType=" + cleanCB.selected.join(", ")

        requestString += "&MinCost=" + priceDS.from + "&MaxCost=" + priceDS.to

        if (val.length !== 0)
            requestString += "&Brand=" + val

        console.log(requestString)

        request.open("GET", requestString);
        request.onreadystatechange = function() {
            if (request.readyState === XMLHttpRequest.DONE && request.status === 200) {

                itemsList = JSON.parse(request.responseText);
            }
        }
        request.send();
    }

    Component.onCompleted: {
        getHoovers(findTxt)
    }

    Column {
        width: parent.width
        height: parent.height

        MenuBar {
            id: mb
            width: parent.width
            regWinX: parent.width / 2 - 225
            regWinY: parent.height / 2 - 187.5
            z: 1

            onFindClicked: {
                console.log(mb.findText)
                if (findTxt.length === 0)
                    getHoovers(mb.findText)
                else
                    findTxt = ""
            }
        }

        Row {
            width: parent.width * 0.15 + (window.width / 6.5) * 3 + window.width * 0.01 * 2.3
            height: parent.height
            spacing: window.width * 0.01
            padding: window.width * 0.01
            anchors.horizontalCenter: parent.horizontalCenter

            Rectangle {
                id: paramRect
                width: window.width * 0.15
                height: window.height

                ScrollView {
                    width: parent.width * 1.1
                    height: parent.height * 0.9

                    Column {
                        width: paramRect.width
                        height: paramRect.height
                        spacing: window.width * 0.01
                        padding: paramRect.width * 0.04

                        OrangeComboBox {
                            id: comboBox
                            width: parent.width
                            height: parent.width * 0.15
                            params: sortParams

                            onSelectionChanged: {
                                console.log(comboBox.currentText)
                                getHoovers("");
                            }
                        }

                        CheckBoxList {
                            id: typeCB
                            param: params[0]
                            paramList: paramsValues[0]
                            width: parent.width

                            onSelChanged: getHoovers("")
                        }

                        CheckBoxList {
                            id: powerCB
                            param: params[1]
                            paramList: paramsValues[1]
                            width: parent.width

                            onSelChanged: getHoovers("")
                        }

                        CheckBoxList {
                            id: cleanCB
                            param: params[2]
                            paramList: paramsValues[2]
                            width: parent.width

                            onSelChanged: getHoovers("")
                        }

                        OrangeDoubleSlider {
                            id: priceDS
                            width: parent.width
                            height: parent.width / 2
                            param: "Цена:"

                            onFromToChanged: getHoovers("")
                        }
                    }
                }
            }

            Rectangle {
                id: itemsRect
                width: (window.width / 6.5) * 3 + window.width * 0.01 * 2
                height: window.height

                ScrollView {
                    width: parent.width
                    height: parent.height * 0.9
                    padding: window.width * 0.005

                    ListView {
                        id: grid
                        spacing: window.width * 0.01
                        width: itemsRect.width
                        height: itemsRect.height
                        model: itemsList

                        delegate: ExtendedHooverListItem {
                            width: grid.width * 0.95

                            name: modelData.title
                            price: modelData.cost
                            model: modelData.hoover.model
                            vendor: modelData.hoover.brand
                            type: modelData.hoover.type
                            bagType: modelData.hoover.dustBagType
                            cleanType: modelData.hoover.cleaningType
                            powerType: modelData.hoover.powerType
                            stars: modelData.hoover.rating
                            reviews: modelData.hoover.amountReviews
                            imageSrc: modelData.imageUrls[0]

                            onBuyClicked: {

                                if (GlobalData.isLogged) {

                                    var request = new XMLHttpRequest()
                                    request.open("PATCH", "http://dustsucker.tonitrusbn.ru/api/User/cart-add/" + GlobalData.userEmail + "/" + modelData.title)
                                    request.setRequestHeader("Content-Type", "application/json")

                                    request.onreadystatechange = function() {
                                        if (request.readyState === XMLHttpRequest.DONE) {
                                            success.open()
                                        }
                                    }

                                    request.send()
                                }
                                else {
                                    loginErr.open()
                                }

                            }

                            onShowClicked: {
                                stackView.replace("HooverDetailWindow.qml", {
                                                    hooverId: modelData.hoover.id,
                                                    imagesLinks: modelData.imageUrls,
                                                    cost: modelData.cost,
                                                    hooverTitle: modelData.title
                                                  })
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
            }
        }
    }
}
