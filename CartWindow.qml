import QtQuick
import QtQuick.Controls
import "."

Item {

    id: window
    objectName: "CartWindow"

    property var itemsList: [["Dyson", 666.0, true, 1], ["Dyson", 666.0, true, 2], ["Dyson", 666.0, true, 1], ["Dyson", 666.0, true, 1],
                             ["Dyson", 666.0, true, 1], ["Dyson", 666.0, true, 1], ["Dyson", 666.0, true, 2], ["Dyson", 666.0, true, 1]]
    property double totalCost: 0

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
                        model: itemsList.length

                        HooverCartItem {
                            width: (window.width / 2.5) * 0.95
                            name: itemsList[index][0]
                            cost: itemsList[index][1]
                            available: itemsList[index][2]
                            countBuys: itemsList[index][3]

                            onCountBuysChanged: {
                                totalCost = 0;
                                for (let i = 0; i < repeater.count; i++) {
                                    let item = repeater.itemAt(i);
                                    if (item) {
                                        totalCost += itemsList[index][1] * item.countBuys;
                                    }
                                }
                            }
                        }
                    }
                }
            }

            FinishBuyItem {
                width: window.width / 5
                cost: totalCost
                y: parent.width * 0.005
            }
        }
    }
}
