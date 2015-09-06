import QtQuick 2.0
import QtGraphicalEffects 1.0
import QtQuick.Controls 1.4

Rectangle {
    id: root
    width: parent.width
    height: parent.width
    clip: true;
    color: "transparent"

    state: "simple"

    property ExclusiveGroup tabGroup
    property string tabName: ""
    property Action action: Action{
        id: tabSelected
        text: tabName
        checkable: true
        checked: false
        exclusiveGroup: tabGroup

        objectName: tabName

        onToggled: {
            if(checked)
                 root.state = "activated";
            else
                root.state = "simple";
        }
    }


    property string icon

    LinearGradient{
        id: back
        anchors.fill: parent
        anchors.rightMargin: 10

        start: Qt.point(width,0);
        end: Qt.point(0,0)

        gradient: Gradient {
                  GradientStop {position: 0;color: "#10101b";}
                  GradientStop {id: ligthColor; position: 0.5; color: "#181820";}
                  GradientStop {position: 1;color: "#10101b";}
                  }

        source: Image{source: "../images/sideIconBack.png";}
        visible: false;
    }

    FastBlur {
        id: blur
            anchors.fill: back
            radius: 16
            source: Image{source: icon}
            visible: false
        }

    OpacityMask{
        id: mask
        anchors.fill: back
        source: back
        maskSource: blur
    }



    MouseArea{
        id: mouse
        anchors.fill: parent
        hoverEnabled: true
        onEntered: {
            if(root.state == "simple")
                root.state = "simpleHovered";
        }
        onExited: {
            if(root.state == "simpleHovered")
                root.state = "simple";
        }
        onClicked: tabSelected.trigger()

    }

    states:[

        State{
            name: "simple"
            PropertyChanges{target: blur; radius:12;}
            PropertyChanges{target: ligthColor; color:"#181820";}
            PropertyChanges{target: back; anchors.rightMargin:10;}
        },
        State{
            name: "simpleHovered"
            PropertyChanges{target: blur; radius: 4;}
            PropertyChanges{target: back; anchors.rightMargin:2;}
        },
        State{
            name: "activated"
            PropertyChanges{target: ligthColor; color:"#212134";}
            PropertyChanges{target: blur; radius: 4;}
            PropertyChanges{target: back; anchors.rightMargin:2;}

        }

    ]
    transitions:[
        Transition {
            to: "simple"

            NumberAnimation {
                target: blur
                property: "radius"
                duration: 700
                easing.type: Easing.InOutQuad
            }
        },

        Transition {
            from: "*"
            NumberAnimation {
                target: back.anchors
                property: "rightMargin"
                duration: 500
                easing.type: Easing.InOutQuad
            }
        }
    ]
}

