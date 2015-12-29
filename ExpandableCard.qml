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
    property alias expandedBgColor: compactBox.color

    signal clicked()

    height: card.height
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

    Card {
        id: card
        height: compactBox.height
        width: parent.width

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
                    name: expanded ? "navigation/arrow_drop_down" : "navigation/arrow_drop_up"
                    anchors.top: parent.top
                    anchors.right: parent.right
                    anchors.rightMargin: Units.dp(8)
                    anchors.topMargin: anchors.rightMargin
                    visible: !sticky
                }
            }

            Rectangle {
                id: expandedBox
                height: childrenRect.height
                width: parent.width
            }
        }
    }
}
