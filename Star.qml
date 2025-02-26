import QtQuick

Canvas {
    property bool fillStar: true

    Style { id: style }

    onPaint: {
        var ctx = getContext("2d")
        ctx.clearRect(0, 0, width, height)
        ctx.fillStyle = fillStar ? style.primaryColor : "transparent"

        var cx = width / 2
        var cy = height / 2
        var size = width / 2

        var points = [
            {x: cx, y: cy - size},
            {x: cx + 0.23 * size, y: cy - 0.30 * size},
            {x: cx + size, y: cy - 0.30 * size},
            {x: cx + 0.38 * size, y: cy + 0.05 * size},
            {x: cx + 0.62 * size, y: cy + 0.80 * size},
            {x: cx, y: cy + 0.30 * size},
            {x: cx - 0.62 * size, y: cy + 0.80 * size},
            {x: cx - 0.38 * size, y: cy + 0.05 * size},
            {x: cx - size, y: cy - 0.30 * size},
            {x: cx - 0.23 * size, y: cy - 0.30 * size}
        ]

        ctx.beginPath()
        ctx.moveTo(points[0].x, points[0].y)

        for (var i = 1; i < points.length; i++)
            ctx.lineTo(points[i].x, points[i].y)

        ctx.closePath()
        if (fillStar)
            ctx.fill()
        ctx.stroke()
    }
}
