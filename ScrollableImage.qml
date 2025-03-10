import QtQuick
import QtQuick.Controls
import "."

Rectangle {
    width: 400
    height: width

    Style { id: style }

    property var images: ["file:///D:/DustSuckerShop/images/dust.png"]
    property int im: 0

    border.width: width * 0.0025
    border.color: style.borderColor
    radius: width * 0.05

    Image {
        width: parent.width * 0.9
        height: width
        source: images[im]
        anchors.centerIn: parent
    }

    Button {
        width: parent.width * 0.05
        height: width

        Text {
            text: "←"
            color: style.borderColor
            font.bold: true
            font.family: style.fontFamily
            font.pointSize: parent.width * 0.7
            anchors.centerIn: parent
        }

        background: Rectangle {
            radius: parent.width / 2
            color: style.primaryColor
        }

        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        anchors.leftMargin: width * 0.1

        onClicked: {
            if (im > 0)
                im--;
            else
                im = images.length;
        }
    }

    Button {
        width: parent.width * 0.05
        height: width

        Text {
            text: "→"
            color: style.borderColor
            font.bold: true
            font.family: style.fontFamily
            font.pointSize: parent.width * 0.7
            anchors.centerIn: parent
        }

        background: Rectangle {
            radius: parent.width / 2
            color: style.primaryColor
        }

        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        anchors.rightMargin: width * 0.1

        onClicked: {
            if (im < images.length - 1)
                im++;
            else
                im = 0;
        }
    }

}
