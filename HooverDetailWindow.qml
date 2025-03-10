import QtQuick
import QtQuick.Controls
import "."

Item {

    id: window
    objectName: "HooverDetailWindow"
    // width: 800
    // height: 600

    Style { id: style }

    property var imagesLinks: ["file:///D:/DustSuckerShop/images/dust.png"]
    property double cost: 666.0
    property string brand: "Дусон"
    property string model: "Сосунец 228"
    property string type: "Вертикальный"
    property string dustBagType: "Многоразовый"
    property string cleaningType: "Сухая"
    property string tubeType: "Телескопическая"
    property double dustBagCapacity: 0.75
    property string filterType: "Пылесборник"
    property double powerConsumption: 0
    property string powerType: "Аккумулятор"
    property double batteryCapacity: 3000
    property double batteryLife: 60
    property double cableLength: 0
    property double suctionPower: 600
    property var nozzlesIncluded: ["Для ковров","Для шерсти"]
    property double weight: 3

    property var comments: [["Шлюха", 5, "Хорошо сосёт"], ["Гриша", 2, "фу бяка"], ["Тварь", 4, "имбочка, но не на 5"]]

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
                    text: brand + " " + model
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
                    text: "Тип: " + type
                    font.family: style.fontFamily
                    font.pointSize: parent.width * 0.02
                }

                Text {
                    text: "Тип пылесборника: " + dustBagType
                    font.family: style.fontFamily
                    font.pointSize: parent.width * 0.02
                }

                Text {
                    text: "Тип уборки: " + cleaningType
                    font.family: style.fontFamily
                    font.pointSize: parent.width * 0.02
                }

                Text {
                    text: "Тип трубы: " + tubeType
                    font.family: style.fontFamily
                    font.pointSize: parent.width * 0.02
                }

                Text {
                    text: "Емкость пылесборника: " + dustBagCapacity
                    font.family: style.fontFamily
                    font.pointSize: parent.width * 0.02
                }

                Text {
                    text: "Тип фильтра: " + filterType
                    font.family: style.fontFamily
                    font.pointSize: parent.width * 0.02
                }

                Text {
                    text: "Потребляемая мощность: " + powerConsumption
                    font.family: style.fontFamily
                    font.pointSize: parent.width * 0.02
                    visible: powerConsumption != 0
                }

                Text {
                    text: "Тип питания: " + powerType
                    font.family: style.fontFamily
                    font.pointSize: parent.width * 0.02
                }

                Text {
                    text: "Емкость батареи: " + batteryCapacity
                    font.family: style.fontFamily
                    font.pointSize: parent.width * 0.02
                    visible: batteryCapacity != 0
                }

                Text {
                    text: "Жизнь батареи: " + batteryLife
                    font.family: style.fontFamily
                    font.pointSize: parent.width * 0.02
                    visible: batteryLife != 0
                }

                Text {
                    text: "Длина кабеля: " + cableLength
                    font.family: style.fontFamily
                    font.pointSize: parent.width * 0.02
                    visible: cableLength != 0
                }

                Text {
                    text: "Мощность всасывания: " + suctionPower
                    font.family: style.fontFamily
                    font.pointSize: parent.width * 0.02
                }

                Text {
                    width: parent.width
                    text: "Насадки в комплекте: " + nozzlesIncluded.join(", ")
                    font.family: style.fontFamily
                    font.pointSize: parent.width * 0.02
                    wrapMode: Text.Wrap
                }

                Text {
                    text: "Вес: " + weight
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
                        width: parent.width
                        height: parent.height
                        anchors.fill: parent
                        wrapMode: Text.Wrap
                        font.family: style.fontFamily
                        font.pointSize: parent.width * 0.02
                        anchors.margins: parent.width * 0.01
                        clip: true
                    }
                }

                Text {
                    text: "Отзывы купивших товар:"
                    font.family: style.fontFamily
                    font.pointSize: parent.width * 0.02
                }

                Repeater {
                    model: comments

                    Comment {
                        width: parent.width
                        name: modelData[0]
                        stars: modelData[1]
                        review: modelData[2]
                    }
                }
            }
        }
    }

}
