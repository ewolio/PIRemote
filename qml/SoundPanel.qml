import QtQuick 2.0
import QtQuick.Controls 1.2

Panel  {
    id: root

    Row{
        id: mixerLayout

        anchors.right: parent.anchors.right
        anchors.top: parent.anchors.top
        anchors.left:  parent.anchors.horizontalCenter
        anchors.bottom: parent.anchors.bottom
        anchors.margins: 10

        spacing: 5

        MasterControl{

        }


        Rectangle{
            width: 1
            height: parent.height
        }

        ListView{
            id: appMixer
            width: mixerLayout.width - 10 - masterMix.width
            orientation: Qt.Horizontal
            model: 2
            delegate: MasterControl{

            }
        }
    }



}

