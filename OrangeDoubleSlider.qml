import QtQuick
import QtQuick.Controls
import Qt5Compat.GraphicalEffects

Rectangle {

    id: root
    width: 200
    height: 120

    Style { id: style }

    property string param: ""

    property int from: min
    property int to: max

    property int min: 0
    property int max: 5000

    signal fromToChanged()

    border.width: parent.width * 0.005
    border.color: style.borderColor
    radius: parent.width * 0.05

    layer.enabled: true
    layer.effect: DropShadow {
        transparentBorder: true
        color: style.borderColor
        samples: 20
    }

    onWidthChanged: {
        _from.x = (root.width * 0.65 * from) / max + root.width * 0.05;
        _to.x = ((to - max) * root.width * 0.65) / max + root.width * 0.70;

        line.x = _from.x + root.width * 0.1
        line.width = _to.x - _from.x
    }

    Column {
        anchors.fill: parent
        width: parent.width
        height: parent.height
        padding: parent.width / 30
        spacing: parent.width / 30
        anchors.topMargin: parent.width * 0.07

        Text {
            height: parent.height / 20 - parent.width * 0.04
            width: parent.width
            text: param
            font.family: style.fontFamily
            font.bold: true
            font.pointSize: root.width / 15
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }

        Row {
            height: parent.height / 2.5 - parent.width * 0.02
            width: parent.width - parent.width * 0.07
            spacing: root.width * 0.1
            padding: root.width * 0.05

            Rectangle {
                height: parent.height * 0.9
                width: parent.width / 2 - root.width * 0.1
                border.width: root.width * 0.005
                border.color: style.borderColor
                radius: root.width * 0.05

                TextInput {
                    text: from
                    font.family: style.fontFamily
                    anchors.fill: parent
                    font.pointSize: root.width / 16
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter

                    onTextChanged: {
                        if (text < min || text > to)
                            text = from.toString();
                        else {
                            from = parseInt(text);
                            _from.x = (root.width * 0.65 * from) / max + root.width * 0.05;

                            line.x = _from.x + root.width * 0.1
                            line.width = _to.x - _from.x

                            fromToChanged()
                        }
                    }
                }
            }

            Rectangle {
                height: parent.height * 0.9
                width: parent.width / 2 - root.width * 0.1
                border.width: root.width * 0.005
                border.color: style.fontFamily
                radius: root.width * 0.05

                TextInput {
                    text: to
                    font.family: style.fontFamily
                    anchors.fill: parent
                    font.pointSize: root.width / 16
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter

                    onTextChanged: {
                        if (text < from || text > max)
                            text = to.toString();
                        else {
                            to = parseInt(text);
                            _to.x = ((to - max) * root.width * 0.65) / max + root.width * 0.70;

                            line.width = _to.x - _from.x;

                            fromToChanged()
                        }
                    }
                }
            }
        }

        Rectangle {
            width: parent.width - parent.width * 0.1
            height: parent.height / 3 - parent.width * 0.04
            color: "transparent"

            Image {
                id: _from
                source: "file:///D:/DustSuckerShop/images/pivo.png"
                width: root.width * 0.2
                height: root.width * 0.2
                z: 1

                Component.onCompleted: {
                    _from.x = root.width * 0.05
                }

                MouseArea {
                    anchors.fill: parent
                    drag.target: parent
                    drag.axis: Drag.XAxis
                    drag.minimumX: root.width * 0.05
                    drag.maximumX: _to.x

                    onMouseXChanged: {
                        from = ((_from.x - root.width * 0.05) * max) / (root.width * 0.65)

                        if (from === to)
                            _from.z = 2
                        else
                            _from.z = 1

                        line.x = _from.x + root.width * 0.1;
                        line.width = _to.x - _from.x;

                        fromToChanged()
                    }
                }
            }

            Rectangle {
                id: line
                width: root.width * 0.7
                height: root.width * 0.01
                x: _from.x + root.width * 0.1
                y: root.width * 0.1
                border.color: style.borderColor
                border.width: root.width * 0.01
            }

            Image {
                id: _to
                width: root.width * 0.2
                height: root.width * 0.2
                source: "file:///D:/DustSuckerShop/images/pivo.png"
                z: 1

                Component.onCompleted: {
                    _to.x = root.width * 0.7
                }

                MouseArea {
                    anchors.fill: parent
                    drag.target: parent
                    drag.axis: Drag.XAxis
                    drag.minimumX: _from.x
                    drag.maximumX: root.width * 0.7

                    onMouseXChanged: {
                        to = max - ((root.width * 0.7 - parent.x) * max / (root.width * 0.65))

                        if (to === from)
                            _to.z = 2
                        else
                            _to.z = 1

                        line.width = _to.x - _from.x;

                        fromToChanged()
                    }
                }
            }
        }
    }
}
