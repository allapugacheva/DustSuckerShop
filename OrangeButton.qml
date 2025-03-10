import QtQuick
import QtQuick.Controls
import Qt5Compat.GraphicalEffects

Button {
    id: but
    width: 100
    height: 30

    Style { id: style }

    font.family: style.fontFamily

    background: Rectangle {
        color: but.pressed ? style.primaryColor : style.activeColor
        radius: parent.width * 0.1
        border.color: style.borderColor
        border.width: parent.width * 0.005

        layer.enabled: true
        layer.effect: DropShadow {
            transparentBorder: true
            color: style.borderColor
            samples: 10
        }
    }
}
