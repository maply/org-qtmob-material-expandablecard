# expandablecard
A Material card with a lower section whose content can be revealed.

Requires [qml-material](http://github.com/papyros/qml-material).

## Installation

Within your app's project folder:

```
git submodule add https://github.com/maply/expandablecard.git lib/expandablecard
git submodule init
git submodule update
```

Add the following line to your app's .pro file:  
`include(expandable-card/org_qtmob_material_expandablecard.pri)`

## Usage example

```qml
import QtQuick 2.5
import Material 0.1
import org.qtmob.material.expandablecard 1.0

Window {
    visible: true
    width: Units.dp(320)
    height: Units.dp(480)

    ListView {
        id: repeater
        currentIndex: -1
        anchors.fill: parent
        spacing: Units.dp(8)
        model: [
            {title:"Title 1",content:"Content 1"},
            {title:"Title 2",content:"Content 2"},
            {title:"Title 3",content:"Content 3"}
        ]
        delegate: ExpandableCard {
            expanded: sticky ? true : ListView.isCurrentItem
            sticky: parent.width > Units.dp(600)
            compactContent: Label {text: modelData.title}
            Label {text: modelData.content}
            onClicked: {
                repeater.currentIndex = (repeater.currentIndex===index) ? -1 : index
            }
        }
    }
}
```
