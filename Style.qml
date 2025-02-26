import QtQuick

QtObject {

    property color primaryColor: "orange"
    property color activeColor: Qt.darker(primaryColor, 0.9)
    property color darkColor: Qt.darker(primaryColor, 2)
    property color lightColor: Qt.darker(primaryColor, 0.6)

    property color divisorColor: "gray"

    property color borderColor: "black"

    property string fontFamily: "Cascadia Code"
}
