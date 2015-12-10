import QtQuick 2.5
import Material 0.1

Item {
    id: expandableCard
    property bool sticky: false
    property bool expanded: sticky
    property int padding: Units.dp(16)
    default property alias expandedContent: expandedContent.children
    property alias compactContent: content.children
    property alias backgroundColor: card.backgroundColor
    property alias tintColor: card.tintColor

    signal clicked()

    height: card.height
    width: parent.width

    states: [
        State {
            name: "isexpanded"
            when: expanded
            PropertyChanges { target: card; height: content.height + expandedContent.height + padding * 3 }
            PropertyChanges { target: card; backgroundColor: sticky ? "white" : Theme.accentColor }
        }
    ]

    transitions: [
        Transition {
            NumberAnimation { properties: "height" }
        }
    ]

    Card {
        id: card
        height: content.height + padding * 2
        width: parent.width

        Column  {
            id: contentLayout
            anchors.margins: padding
            anchors.fill: parent
            spacing: padding

            Item {
                id: content
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
                    name: expanded ? "navigation/arrow_drop_down" : "navigation/arrow_drop_up"
                    anchors.right: parent.right
                    visible: !sticky
                }
            }

            Item {
                id: expandedContent
                height: childrenRect.height
                width: parent.width
            }
        }
    }
}
