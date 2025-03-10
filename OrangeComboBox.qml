import QtQuick
import QtQuick.Controls
import Qt5Compat.GraphicalEffects

Rectangle {
    id: comboRect
    width: 100
    height: 20

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
        font.family: style.fontFamily
        font.pointSize: parent.height * 0.3

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
                font.pointSize: parent.height * 0.3
                font.family: style.fontFamily
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
            leftMargin: comboRect.width * 0.05

            delegate: ItemDelegate {
                width: comboBox.width - comboRect.width * 0.1
                height: comboBox.height
                contentItem: Text {
                    text: modelData
                    color: "black"
                    font.family: style.fontFamily
                    font.pointSize: parent.height * 0.3
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
