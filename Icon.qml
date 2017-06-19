import QtQuick 2.7

Image {
    id: icon

    property string name
    property string color: "white"

    width: 24
    height: width
    source: Qt.resolvedUrl("ic_"+name+"_"+color+"_24dp_2x.png")
}
