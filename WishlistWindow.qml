import QtQuick
import QtQuick.Controls
import "."

Item {
    id: window
    // width: 1000
    // height: 500
    objectName: "WishlistWindow"

    property var itemsList: [["Dyson", "666,00 р.", "V11 Absolute", "Dyson", "вертикальный", "многоразовый", "сухая", "аккумулятор", 3, 6],
                         ["Dyson", "666,00 р.", "V11 Absolute", "Dyson", "вертикальный", "многоразовый", "сухая", "аккумулятор", 3, 6],
                         ["Dyson", "666,00 р.", "V11 Absolute", "Dyson", "вертикальный", "многоразовый", "сухая", "аккумулятор", 3, 6],
                         ["Roma", "666,00 р.", "V11 Absolute", "Dyson", "вертикальный", "многоразовый", "сухая", "аккумулятор", 3, 6],
                         ["Karcher", "666,00 р.", "V11 Absolute", "Dyson", "вертикальный", "многоразовый", "сухая", "аккумулятор", 3, 6],
                         ["Karcher", "666,00 р.", "V11 Absolute", "Dyson", "вертикальный", "многоразовый", "сухая", "аккумулятор", 3, 6]]

    Column {
        width: parent.width
        height: parent.height
        anchors.fill: parent

        MenuBar {
            width: parent.width
            //height: parent.width / 25
            regWinX: parent.width / 2 - 225
            regWinY: parent.height / 2 - 187.5
        }

        ScrollView {
            width: parent.width / 2
            height: parent.height
            anchors.horizontalCenter: parent.horizontalCenter

            Column {
                id: col
                width: parent.width * 0.9
                height: parent.height * 0.9
                spacing: parent.height * 0.01
                padding: parent.height * 0.02

                Repeater {
                    model: itemsList

                    ExtendedHooverListItem {
                        width: (window.width / 2) * 0.9

                        name: itemsList[index][0]
                        price: itemsList[index][1]
                        model: itemsList[index][2]
                        vendor: itemsList[index][3]
                        type: itemsList[index][4]
                        bagType: itemsList[index][5]
                        cleanType: itemsList[index][6]
                        powerType: itemsList[index][7]
                        stars: itemsList[index][8]
                        reviews: itemsList[index][9]
                    }
                }
            }
        }
    }
}
