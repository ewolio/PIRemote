import QtQuick 2.0
import QtQuick.Controls 1.2

Column{
    id: root

    property string channelName: ""
    property alias value: master.value
    property alias muted: masterMute.checked

    Slider{
        id: master
        orientation: Qt.Vertical
        onValueChanged: masterMute.checked= false
    }
    Button{
        id: masterMute
        width: height
        checkable: true

    }
    Text{
        color: "white"
        text: channelName
    }
}

