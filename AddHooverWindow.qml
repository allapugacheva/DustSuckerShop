import QtQuick
import QtQuick.Controls
import "."

Item {

    id: window
    objectName: "AddHooverWindow"

    Style { id: style }

    property var imagesLinks: []

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
                        font.pointSize: col.width * 0.02
                    }

                    OrangeTextInput {
                        id: brandInp
                        width: col.width
                        height: col.height * 0.018
                    }
                }

                Column {
                    Text {
                        text: "Модель:"
                        font.family: style.fontFamily
                        font.pointSize: col.width * 0.02
                    }

                    OrangeTextInput {
                        id: modelInp
                        width: col.width
                        height: col.height * 0.018
                    }
                }

                OrangeButton {
                    width: parent.width * 0.3
                    height: width * 0.15
                    text: "Добавить фотографии"
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pointSize: col.width * 0.015

                    onClicked: {
                        var filePath = fileDialogHelper.openFileDialog()
                        if (filePath) {
                            console.log(filePath)
                            fileUploader.uploadFile(filePath)
                        }
                    }

                    Connections {
                        target: fileUploader
                        onUploadFinished: function(response) {
                            var obj = JSON.parse(response)
                            imagesLinks.push(obj.imageUrl)
                            si.images = imagesLinks
                        }
                        onUploadError: function(error) {
                            photoErr.open()
                        }
                    }

                    Dialog {
                        id: photoErr
                        title: "Ошибка"
                        modal: true
                        standardButtons: Dialog.Ok

                        implicitWidth: 300
                        implicitHeight: 150

                        anchors.centerIn: window

                        contentItem: Text {
                            text: "Ошибка загрузки фото"
                            font.pixelSize: 16
                            horizontalAlignment: Text.AlignHCenter
                        }
                    }
                }

                ScrollableImage {
                    id: si
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
                        font.pointSize: col.width * 0.02
                    }

                    OrangeTextInput {
                        id: priceInp
                        width: col.width
                        height: col.height * 0.018
                    }
                }

                Column {
                    width: parent.width
                    Text {
                        width: parent.width
                        text: paramsList[0][0]
                        font.family: "Cascadia Code"
                        font.pointSize: parent.width * 0.02
                        horizontalAlignment: Text.AlignHCenter
                    }

                    OrangeComboBox {
                        id: typeInp
                        width: parent.width * 0.6
                        height: width * 0.1
                        params: paramsList[0][1]
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }

                Column {
                    width: parent.width
                    Text {
                        width: parent.width
                        text: paramsList[1][0]
                        font.family: "Cascadia Code"
                        font.pointSize: parent.width * 0.02
                        horizontalAlignment: Text.AlignHCenter
                    }

                    OrangeComboBox {
                        id: bagInp
                        width: parent.width * 0.6
                        height: width * 0.1
                        params: paramsList[1][1]
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }

                Column {
                    width: parent.width
                    Text {
                        width: parent.width
                        text: paramsList[2][0]
                        font.family: "Cascadia Code"
                        font.pointSize: parent.width * 0.02
                        horizontalAlignment: Text.AlignHCenter
                    }

                    OrangeComboBox {
                        id: cleanInp
                        width: parent.width * 0.6
                        height: width * 0.1
                        params: paramsList[2][1]
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }

                Column {
                    width: parent.width
                    Text {
                        width: parent.width
                        text: paramsList[3][0]
                        font.family: "Cascadia Code"
                        font.pointSize: parent.width * 0.02
                        horizontalAlignment: Text.AlignHCenter
                    }

                    OrangeComboBox {
                        id: tubeInp
                        width: parent.width * 0.6
                        height: width * 0.1
                        params: paramsList[3][1]
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }

                Column {
                    width: parent.width
                    Text {
                        width: parent.width
                        text: paramsList[4][0]
                        font.family: "Cascadia Code"
                        font.pointSize: parent.width * 0.02
                        horizontalAlignment: Text.AlignHCenter
                    }

                    OrangeComboBox {
                        id: filterInp
                        width: parent.width * 0.6
                        height: width * 0.1
                        params: paramsList[4][1]
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }

                Column {
                    width: parent.width
                    Text {
                        width: parent.width
                        text: paramsList[5][0]
                        font.family: "Cascadia Code"
                        font.pointSize: parent.width * 0.02
                        horizontalAlignment: Text.AlignHCenter
                    }

                    OrangeComboBox {
                        id: ptInp
                        width: parent.width * 0.6
                        height: width * 0.1
                        params: paramsList[5][1]
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }

                Column {
                    Text {
                        text: "Емкость пылесборника:"
                        font.family: style.fontFamily
                        font.pointSize: col.width * 0.02
                    }

                    OrangeTextInput {
                        id: dbcapInp
                        width: col.width
                        height: col.height * 0.018
                    }
                }

                Column {
                    Text {
                        text: "Потребляемая мощность:"
                        font.family: style.fontFamily
                        font.pointSize: col.width * 0.02
                    }

                    OrangeTextInput {
                        id: powerInp
                        width: col.width
                        height: col.height * 0.018
                    }
                }

                Column {
                    Text {
                        text: "Емкость батареи:"
                        font.family: style.fontFamily
                        font.pointSize: col.width * 0.02
                    }

                    OrangeTextInput {
                        id: batInp
                        width: col.width
                        height: col.height * 0.018
                    }
                }

                Column {
                    Text {
                        text: "Жизнь батареи:"
                        font.family: style.fontFamily
                        font.pointSize: col.width * 0.02
                    }

                    OrangeTextInput {
                        id: blInp
                        width: col.width
                        height: col.height * 0.018
                    }
                }

                Column {
                    Text {
                        text: "Длина кабеля:"
                        font.family: style.fontFamily
                        font.pointSize: col.width * 0.02
                    }

                    OrangeTextInput {
                        id: clInp
                        width: col.width
                        height: col.height * 0.018
                    }
                }

                Column {
                    Text {
                        text: "Мощность всасывания:"
                        font.family: style.fontFamily
                        font.pointSize: col.width * 0.02
                    }

                    OrangeTextInput {
                        id: spInp
                        width: col.width
                        height: col.height * 0.018
                    }
                }

                Column {
                    Text {
                        text: "Вес:"
                        font.family: style.fontFamily
                        font.pointSize: col.width * 0.02
                    }

                    OrangeTextInput {
                        id: weightInp
                        width: col.width
                        height: col.height * 0.018
                    }
                }

                CheckBoxList {
                    id: nozzlesInp
                    param: "Насадки в комплекте:"
                    paramList: nozzles
                    width: parent.width * 0.35
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                OrangeButton {
                    width: parent.width * 0.3
                    height: width * 0.1
                    text: "Добавить"
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pointSize: col.width * 0.015

                    onClicked: {
                        var url = "http://dustsucker.tonitrusbn.ru/api/Advertisement";
                        var xhr = new XMLHttpRequest();
                        xhr.open("POST", url, true);
                        xhr.setRequestHeader("Content-Type", "application/json");

                        xhr.onreadystatechange = function() {
                            if (xhr.readyState === XMLHttpRequest.DONE) {
                                if (xhr.status === 200 || xhr.status === 201) {
                                    console.log("Успешно:", xhr.responseText);
                                } else {
                                    console.log("Ошибка:", xhr.status, xhr.responseText);
                                }
                            }
                        };

                        var data = {
                            "title": brandInp.text + " " + modelInp.text,
                            "description": "nice",
                            "cost": priceInp.text,
                            "status": "active",
                            "publishDate": Qt.formatDate(new Date(), "dd.MM.yyyy 00:00"),
                            "imageUrls": imagesLinks,
                            "hoover": {
                                "brand": brandInp.text,
                                "model": modelInp.text,
                                "type": typeInp.currentText,
                                "dustBagType": bagInp.currentText,
                                "cleaningType": cleanInp.currentText,
                                "tubeType": tubeInp.currentText,
                                "dustBagCapacity": dbcapInp.text,
                                "filterType": filterInp.currentText,
                                "powerConsumption": powerInp.text,
                                "powerType": ptInp.currentText,
                                "batteryCapacity": batInp.text,
                                "batteryLife": blInp.text,
                                "cableLength": clInp.text,
                                "suctionPower": spInp.text,
                                "nozzlesIncluded": nozzlesInp.selected,
                                "weight": weightInp.text
                            }
                        };

                        console.log(JSON.stringify(data))

                        xhr.send(JSON.stringify(data));
                    }
                }
            }
        }
    }

}
