import QtQuick
import QtQuick.Controls
import "."

Item {

    id: window
    property var params: ["Бренд:", "Тип:"]
    property var paramsValues: [["хуесос", "пиздосос"], ["ручной", "на цепи", "сосунец", "промышленный"]]
    property var sortParams: ["По цене ↑", "По цене ↓", "По дате выпуска ↑", "По дате выпуска ↓"]

    property var itemsList: [[3, "Сосунец 228", "666,00 р."], [2, "Сосунец 1", "0,00 р."], [5, "Сосунчик", "69,00 р."],
                             [4, "Сосатель", "5,00 р."], [1, "Сосалка", "1,00 р."]]

    Column {
        width: parent.width
        height: parent.height

        MenuBar {
            width: parent.width
            height: parent.width / 25
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
                            model: 5

                            HooverListItem {
                                width: window.width / 6.5 - grid.columnSpacing
                                height: width * 1.6 - grid.rowSpacing

                                stars: itemsList[index][0]
                                name: itemsList[index][1]
                                price: itemsList[index][2]
                            }
                        }
                    }
                }
            }
        }
    }
}
