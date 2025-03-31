import QtQuick
import QtQuick.Controls
import "."

Item {

    id: window
    objectName: "CartWindow"

    //property var itemsList: [["Dyson", 666.0, true, 1], ["Dyson", 666.0, true, 2], ["Dyson", 666.0, true, 1], ["Dyson", 666.0, true, 1],
    //                         ["Dyson", 666.0, true, 1], ["Dyson", 666.0, true, 1], ["Dyson", 666.0, true, 2], ["Dyson", 666.0, true, 1]]
    property double totalCost: itemsList ? itemsList.reduce((sum, item) => sum + item.cost, 0) : 0

    property var itemsList

    function getHoovers() {

        var request = new XMLHttpRequest();
        var requestString = "http://dustsucker.tonitrusbn.ru/api/User/cart-short/" + GlobalData.userEmail;

        request.open("GET", requestString);
        request.onreadystatechange = function() {
            if (request.readyState === XMLHttpRequest.DONE && request.status === 200) {

                itemsList = JSON.parse(request.responseText);
            }
        }
        request.send();
    }

    Component.onCompleted: {

        getHoovers()
    }

    function countCost() {
        totalCost = 0;
        for (let i = 0; i < repeater.count; i++) {
            let item = repeater.itemAt(i);
            if (item) {
                totalCost += item.cost * item.countBuys;
            }
        }
    }

    Column {
        width: parent.width
        height: parent.height

        MenuBar {
            width: parent.width
            regWinX: parent.width / 2 - 225
            regWinY: parent.height / 2 - 187.5
        }

        Row {
            width: parent.width / 2.5 + parent.width / 5 + parent.width * 0.03
            height: parent.height - parent.width / 25
            anchors.horizontalCenter: parent.horizontalCenter
            padding: parent.width * 0.01
            spacing: parent.width * 0.005

            ScrollView {
                width: window.width / 2.5
                height: parent.height * 0.98

                Column {
                    width: parent.width
                    height: parent.height
                    padding: parent.width * 0.01
                    spacing: parent.width * 0.01

                    Repeater {
                        id: repeater
                        model: itemsList

                        HooverCartItem {
                            width: (window.width / 2.5) * 0.95
                            name: itemsList[index].title
                            cost: itemsList[index].cost
                            available: itemsList[index].status === "active"
                            imageSrc: itemsList[index].mainImageUrl
                            countBuys: 1

                            onCountBuysChanged: countCost()

                            onDeleteHooverClicked: {
                                var request = new XMLHttpRequest()
                                request.open("PATCH", "http://dustsucker.tonitrusbn.ru/api/User/cart-remove/" + GlobalData.userEmail + "/" + itemsList[index].title)
                                request.setRequestHeader("Content-Type", "application/json")

                                request.onreadystatechange = function() {
                                    if (request.readyState === XMLHttpRequest.DONE) {
                                        getHoovers()
                                    }
                                }

                                request.send()
                            }
                        }
                    }
                }
            }

            FinishBuyItem {
                width: window.width / 5
                cost: totalCost
                y: parent.width * 0.005

                onBuy: {

                    for (let i = 0; i <  itemsList.length; i++) {
                        var request = new XMLHttpRequest()
                        console.log("http://dustsucker.tonitrusbn.ru/api/User/cart-remove/" + GlobalData.userEmail + "/" + itemsList[i].title)

                        request.open("PATCH", "http://dustsucker.tonitrusbn.ru/api/User/cart-remove/" + GlobalData.userEmail + "/" + itemsList[i].title)
                        request.setRequestHeader("Content-Type", "application/json")

                        request.onreadystatechange = function() {
                            if (request.readyState === XMLHttpRequest.DONE) {
                                console.log("Ответ сервера:", request.status, request.responseText);
                            }
                        }

                        request.send()
                    }

                    itemsList = []
                    success.open()
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
                        text: "Заказ успешно оформлен"
                        font.pixelSize: 16
                        horizontalAlignment: Text.AlignHCenter
                    }
                }
            }
        }
    }
}
