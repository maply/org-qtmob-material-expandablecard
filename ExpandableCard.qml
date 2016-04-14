import QtQuick 2.5
import Material 0.1

Item {
    id: expandableCard

    property bool sticky: false
    property bool expanded: sticky
    property int padding: Units.dp(16)
    default property alias expandedContent: expandedBox.children
    property alias compactContent: compactBox.children
    property alias backgroundColor: card.backgroundColor
    property alias compactBgColor: compactBox.color
    //property alias expandedBgColor: compactBox.color
    property alias backgroundItem: background.children
    property alias preamble: preamble.children

    signal clicked()

    height: card.height + preamble.height
    width: parent.width

    states: [
        State {
            name: "isexpanded"
            when: expanded
            PropertyChanges { target: card; height: compactBox.height + expandedBox.height }
        }
    ]

    transitions: [
        Transition {
            NumberAnimation { properties: "height" }
        }
    ]

    Item {
        id: preamble
        visible: children[0].visible
        height: visible ? childrenRect.height : 0
        width: parent.width
    }

    Card {
        id: card
        anchors.top: preamble.bottom
        height: compactBox.height
        width: parent.width

        Item {
            id: background
            anchors.fill: parent
        }

        Column  {
            id: contentLayout
            anchors.fill: parent
            spacing: 0

            Rectangle {
                id: compactBox
                height: childrenRect.height
                width: parent.width

                Ink {
                    anchors.fill: parent
                    onClicked: {
                        expandableCard.clicked()
                    }
                }

                Icon {
                    id: revealIcon
                    color: "white"
                    name: expanded ? "navigation/arrow_drop_down" : "navigation/arrow_drop_up"
                    anchors.top: parent.top
                    anchors.right: parent.right
                    anchors.rightMargin: Units.dp(8)
                    anchors.topMargin: anchors.rightMargin
                    visible: !sticky
                }
            }

            Item {
                id: expandedBox
                height: childrenRect.height
                width: parent.width
            }
        }
    }
}
