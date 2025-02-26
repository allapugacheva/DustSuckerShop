import QtQuick
import QtQuick.Controls
import Qt5Compat.GraphicalEffects

Button {
    id: but

    Style { id: style }

    // property color backgroundDefaultColor: "orange"
    // property color backgroundPressedColor: Qt.darker(backgroundDefaultColor, 0.9)

    background: Rectangle {
        color: but.pressed ? style.primaryColor : style.activeColor
        radius: parent.width * 0.1
        border.color: style.borderColor
        border.width: parent.width * 0.01

        layer.enabled: true
        layer.effect: DropShadow {
            transparentBorder: true
            color: style.borderColor
            samples: 20
        }
    }
}
