import QtQuick

Canvas {
    id: heart
    property bool fillHeart: true

    Style { id: style }

    onPaint: {
        var ctx = getContext("2d")
        ctx.clearRect(0, 0, width, height)
        ctx.fillStyle = fillHeart ? style.primaryColor : "transparent"

        ctx.beginPath()
        ctx.moveTo(width / 2, height * 0.8)
        ctx.bezierCurveTo(width * 1.1, height * 0.4,
                          width * 0.8, height * 0.1,
                          width / 2, height * 0.3)
        ctx.bezierCurveTo(width * 0.2, height * 0.1,
                          width * -0.1, height * 0.4,
                          width / 2, height * 0.8)

        if (fillHeart)
            ctx.fill()
        ctx.stroke()
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            fillHeart = !fillHeart
            heart.requestPaint()
        }
    }
}
