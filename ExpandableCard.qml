import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0

Item {
    id: expandableCard

    property bool sticky: false
    property bool expanded: sticky
    default property alias expandedContent: expandedBox.children
    property alias compactContent: compactBox.children
    property color backgroundColor
    property color compactBgColor
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

    Pane {
        id: card
        Material.elevation: 2
        Material.background: backgroundColor
        padding: 0
        clip: true
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

            ItemDelegate {
                id: compactBox
                padding: 0
                Material.background: compactBgColor
                onClicked: expandableCard.clicked()
                height: childrenRect.height
                width: parent.width

                Icon {
                    id: revealIcon
                    color: "white"
                    name: expanded ? "arrow_drop_down" : "arrow_drop_up"
                    anchors.top: parent.top
                    anchors.right: parent.right
                    anchors.rightMargin: 8
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
