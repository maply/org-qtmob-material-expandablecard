# expandable-card
A Material card with a lower section whose content can be revealed

Requires [qml-material](http://github.com/papyros/qml-material).

Example usage:

```
import QtQuick 2.5
import Material 0.1

Window {
    visible: true
    width: Units.dp(320)
    height: Units.dp(480)

    ListView {
        id: repeater
        currentIndex: -1
        anchors.fill: parent
        spacing: Units.dp(8)
        model: ["Val Seriana", "Terre del Vescovado", "Val Cavallina"]
        delegate: ExpandableCard {
            expanded: sticky ? true : ListView.isCurrentItem
            sticky: parent.width > Units.dp(600)
            compactContent: Label {text: modelData}
            Rectangle {height: 90; width: 30; color: "green"}
            onClicked: {
                repeater.currentIndex = index
            }
        }
    }
}
```
