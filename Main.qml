import QtQuick
import QtQuick.Controls
import Qt5Compat.GraphicalEffects
import "."

Window {
    id: window
    visibility: Window.Maximized
    visible: true
    title: qsTr("Dust Sucker Shop")

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: "MainWindow.qml"
    }
}
