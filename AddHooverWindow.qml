import QtQuick
import QtQuick.Controls
import "."

Item {

    id: window
    objectName: "AddHooverWindow"
    // width: 800
    // height: 600

    Style { id: style }

    property var imagesLinks: ["file:///D:/DustSuckerShop/images/dust.png"]

    property var paramsList: [["Тип", ["Классический", "Автомобильный", "Робот-пылесос", "Вертикальный", "Промышленный"]],
                              ["Тип мешка", ["Бумажный", "Синтетический", "Многоразовый", "Антибактериальный"]],
                              ["Тип уборки", ["Сухая", "Моющая", "Аквафильтр"]],
                              ["Тип трубы", ["Цельная", "Составная", "Телескопическая"]],
                              ["Тип фильтра", ["Пылесборник", "Моторный"]],
                              ["Тип питания", ["Аккумулятор", "Источник питания", "Комбинированный"]]]

    property var nozzles: ["Для сухой уборки", "Для влажной уборки", "Для ковров", "Для ровных покрытий", "Для шерсти", "Строительный насадки"]

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
            anchors.margins: parent.width * 0.5 * 0.02

            Column {
                id: col
                width: parent.width
                height: parent.height
                spacing: parent.width * 0.02

                Column {
                    Text {
                        text: "Бренд:"
                        font.family: style.fontFamily
                        font.pointSize: col.width * 0.015
                    }

                    OrangeTextInput {
                        width: col.width
                        height: col.height * 0.015
                    }
                }

                Column {
                    Text {
                        text: "Модель:"
                        font.family: style.fontFamily
                        font.pointSize: col.width * 0.015
                    }

                    OrangeTextInput {
                        width: col.width
                        height: col.height * 0.015
                    }
                }

                OrangeButton {
                    width: parent.width * 0.3
                    height: width * 0.15
                    text: "Добавить фотографии"
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                ScrollableImage {
                    width: parent.width * 0.5
                    images: imagesLinks
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Rectangle {
                    color: style.borderColor
                    width: parent.width
                    height: parent.width * 0.005
                }

                Column {
                    Text {
                        text: "Цена:"
                        font.family: style.fontFamily
                        font.pointSize: col.width * 0.015
                    }

                    OrangeTextInput {
                        width: col.width
                        height: col.height * 0.015
                    }
                }

                Repeater {
                    model: paramsList

                    Column {
                        width: parent.width

                        Text {
                            width: parent.width
                            text: modelData[0]
                            font.family: "Cascadia Code"
                            font.pointSize: parent.width * 0.02
                            horizontalAlignment: Text.AlignHCenter
                        }

                        OrangeComboBox {
                            width: parent.width * 0.6
                            height: width * 0.1
                            params: modelData[1]
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                    }
                }

                Column {
                    Text {
                        text: "Емкость пылесборника:"
                        font.family: style.fontFamily
                        font.pointSize: col.width * 0.015
                    }

                    OrangeTextInput {
                        width: col.width
                        height: col.height * 0.015
                    }
                }

                Column {
                    Text {
                        text: "Потребляемая мощность:"
                        font.family: style.fontFamily
                        font.pointSize: col.width * 0.015
                    }

                    OrangeTextInput {
                        width: col.width
                        height: col.height * 0.015
                    }
                }

                Column {
                    Text {
                        text: "Емкость батареи:"
                        font.family: style.fontFamily
                        font.pointSize: col.width * 0.015
                    }

                    OrangeTextInput {
                        width: col.width
                        height: col.height * 0.015
                    }
                }

                Column {
                    Text {
                        text: "Жизнь батареи:"
                        font.family: style.fontFamily
                        font.pointSize: col.width * 0.015
                    }

                    OrangeTextInput {
                        width: col.width
                        height: col.height * 0.015
                    }
                }

                Column {
                    Text {
                        text: "Длина кабеля:"
                        font.family: style.fontFamily
                        font.pointSize: col.width * 0.015
                    }

                    OrangeTextInput {
                        width: col.width
                        height: col.height * 0.015
                    }
                }

                Column {
                    Text {
                        text: "Мощность всасывания:"
                        font.family: style.fontFamily
                        font.pointSize: col.width * 0.015
                    }

                    OrangeTextInput {
                        width: col.width
                        height: col.height * 0.015
                    }
                }

                Column {
                    Text {
                        text: "Вес:"
                        font.family: style.fontFamily
                        font.pointSize: col.width * 0.015
                    }

                    OrangeTextInput {
                        width: col.width
                        height: col.height * 0.015
                    }
                }

                CheckBoxList {
                    param: "Насадки в комплекте:"
                    paramList: nozzles
                    width: parent.width * 0.4
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                OrangeButton {
                    width: parent.width * 0.4
                    height: width * 0.15
                    text: "Добавить"
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }
        }
    }

}
