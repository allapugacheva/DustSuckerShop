import QtQuick
import QtQuick.Controls
import Qt5Compat.GraphicalEffects

Rectangle {
    id: comboRect

    Style { id: style }

    property var params: []

    border.width: parent.width * 0.05
    border.color: style.borderColor
    radius: parent.width * 0.05

    layer.enabled: true
    layer.effect: DropShadow {
        transparentBorder: true
        color: style.borderColor
        samples: 20
    }

    ComboBox {
        id: comboBox
        width: parent.width
        height: parent.height
        anchors.fill: parent
        model: params

        background: Rectangle {
            color: "white"
            radius: comboRect.width * 0.05
            border.color: style.borderColor
        }

        delegate: ItemDelegate {
            width: parent.width
            height: parent.height

            contentItem: Text {
                text: modelData
                color: "black"
                font.pointSize: parent.width / 16
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
            background: Rectangle {
                color: "white"
                radius: comboRect.width * 0.05
            }
        }

        popup.contentItem: ListView {
            model: comboBox.model
            clip: true
            implicitHeight: contentHeight
            leftMargin: 10

            delegate: ItemDelegate {
                width: comboBox.width - comboRect.width * 0.1
                height: comboBox.height
                contentItem: Text {
                    text: modelData
                    color: "black"
                    font.pixelSize: parent.width / 16
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                background: Rectangle {
                    border.color: style.borderColor
                    color: style.lightColor
                }
                onClicked: {

                    comboBox.currentIndex = index
                    comboBox.popup.close()
                }
            }
        }

        popup.background: Rectangle { color: "transparent" }
    }
}
