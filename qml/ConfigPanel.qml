import QtQuick 2.0
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.4


Flow {
    id: root

    anchors.fill: parent
    anchors.margins: 20
    flow: Flow.TopToBottom
    Rectangle{
        id: configHeader
        Text{
            id: title
            text: "Configuration"
            color: "white"
            anchors.leftMargin: root.width*.2
            anchors.fill: parent
            font.pointSize: root.height*.1
        }
        Rectangle{
            color: "white"
            x: root.width*.04
            y: root.height*.17
            height: 2
            width: root.width*.9
        }
        color: "transparent"
        height: root.height*.18
        width: parent.width
    }

    GridLayout{
        width: root.width
        columns: 2
        columnSpacing: root.width*.05

        Text{
            text: "Nom Remote"
            color: "white"
            Layout.alignment: Qt.AlignRight
            Layout.leftMargin: 50
        }

        TextField{
            id: nomRemote
            Layout.preferredWidth: root.width*.6
        }

        Text{
            text: "Serveur"
            color: "white"
            Layout.alignment: Qt.AlignRight
        }

        TextField{
            id: serverAddress
            placeholderText: "Adresse IP"
            Layout.preferredWidth: root.width*.6
        }

        Text{
            text: "Port"
            color: "white"
            Layout.alignment: Qt.AlignRight
        }

        TextField{
            id: port
            Layout.preferredWidth: root.width*.6
        }
    }
}

