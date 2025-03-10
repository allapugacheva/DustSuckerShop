import QtQuick
import QtQuick.Controls
import "."

Item {

    id: window
    objectName: "MainWindow"
    property var params: ["Бренд:", "Тип:"]
    property var paramsValues: [["Dyson", "Karcher"], ["ручной", "автомобильный", "робот", "промышленный"]]
    property var sortParams: ["По цене ↑", "По цене ↓", "По дате выпуска ↑", "По дате выпуска ↓"]

    property var itemsList: [[3, "Dyson", "666,00 р."], [2, "Karcher", "0,00 р."], [5, "Dyson", "69,00 р."],
                             [4, "Dyson", "5,00 р."], [1, "Karcher", "1,00 р."]]

    Column {
        width: parent.width
        height: parent.height

        MenuBar {
            width: parent.width
            regWinX: parent.width / 2 - 225
            regWinY: parent.height / 2 - 187.5
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
                    height: parent.height * 1.1

                    Column {
                        width: paramRect.width
                        height: paramRect.height
                        spacing: window.width * 0.01
                        padding: paramRect.width * 0.04

                        OrangeComboBox {
                            width: parent.width
                            height: parent.width * 0.15
                            params: sortParams
                        }

                        Repeater {
                            model: params.length

                            CheckBoxList {
                                param: params[index]
                                paramList: paramsValues[index]
                                width: parent.width
                                //height: paramsValues[index].length * parent.width * 0.25
                            }
                        }

                        OrangeDoubleSlider {
                            width: parent.width
                            height: parent.width / 2
                            param: "Промилли:"
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
                    height: parent.height

                    Grid {
                        id: grid
                        rows: 4
                        columns: 3
                        rowSpacing: window.width * 0.01
                        columnSpacing: window.width * 0.01
                        width: itemsRect.width
                        height: itemsRect.height
                        padding: itemsRect.width * 0.015

                        Repeater {
                            model: itemsList.length

                            HooverListItem {
                                width: window.width / 6.5 - grid.columnSpacing
                                height: width * 1.6 - grid.rowSpacing

                                stars: itemsList[index][0]
                                name: itemsList[index][1]
                                price: itemsList[index][2]

                                MouseArea {
                                    anchors.fill: parent

                                    onClicked: {
                                        stackView.replace("HooverDetailWindow.qml");
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
