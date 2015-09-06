import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtGraphicalEffects 1.0
import "./qml"
Window {
    id: screen
    title: qsTr("PIRemote")
    width: 1920/2
    height: 1080/2
    visible: true
    color: "#4a4a69"

    Rectangle{
        id: mainPanel

        width: screen.width-panelApps.width-panelHome.width
        height: screen.height
        x: panelApps.width
        y:0

        color: "#10101b"






        ConfigPanel{
            id: configPanel
        }
        ControlPanel{
            id: controlPanel
        }
        SoundPanel{
            id: soundPanel
        }
        HomePanel{
            id: homePanel
        }

        states: [
        State{
               name: "home"
               PropertyChanges{target: homePanel; y:0}
               PropertyChanges{target: soundPanel; y:0}
               PropertyChanges{target: controlPanel; y:0}
            },
        State{
               name: "sound"
               PropertyChanges{target: homePanel; y:-screen.height}
               PropertyChanges{target: soundPanel; y:0}
               PropertyChanges{target: controlPanel; y:0}
            },
        State{
               name: "control"
               PropertyChanges{target: homePanel; y:-screen.height}
               PropertyChanges{target: soundPanel; y:-screen.height}
               PropertyChanges{target: controlPanel; y:0}
            },
        State{
               name: "config"
               PropertyChanges{target: homePanel; y:-screen.height}
               PropertyChanges{target: soundPanel; y:-screen.height}
               PropertyChanges{target: controlPanel; y:-screen.height}
            }
        ]

        onStateChanged: console.warn("State: " + state)

        transitions:[
            Transition{
                NumberAnimation{target:homePanel; property: "y"; duration: 500;}
                NumberAnimation{target:soundPanel; property: "y"; duration: 600;}
                NumberAnimation{target:controlPanel; property: "y"; duration: 700;}
            }

        ]
    }

    ExclusiveGroup{
        id: tabGroup
        onCurrentChanged:{
            console.warn(current.objectName);
            mainPanel.state = current.objectName;
        }
    }

    Rectangle{
        id: panelApps
        x:0
        y:0
        anchors.left: mainPanel.anchors.right
        width: screen.width*.07
        height: screen.height
        color: "transparent"
        LinearGradient{
            id: appsPanelBorderGradient
            x:parent.width-width
            width: 15
            height: parent.height
            start: Qt.point(0,0)
            end: Qt.point(width,0)

            gradient: Gradient{
            GradientStop{position:0; color: "transparent";}
            GradientStop{position:.8; color: "#33000000";}
            GradientStop{position:1; color: "#55000000";}
            }
        }
    }
    Rectangle{
        id: panelHome
        x: screen.width-width
        y:0
        anchors.left: mainPanel.anchors.right
        width: screen.width*.07
        height: screen.height
        color: "transparent"
        LinearGradient{
            id: homePanelBorderGradient
            width: 15
            height: parent.height
            start: Qt.point(width,0)
            end: Qt.point(0,0)

            gradient: Gradient{
            GradientStop{position:0; color: "transparent";}
            GradientStop{position:.8; color: "#33000000";}
            GradientStop{position:1; color: "#55000000";}
            }
        }
        Flow{
            anchors.fill: parent
            anchors.topMargin: 10
            anchors.bottomMargin: 10
            flow: Flow.TopToBottom

            spacing: 10

            DockIcon{
                icon: "../images/homeIcon.png"
                tabName: "home"
                tabGroup: tabGroup

            }
            DockIcon{
                icon: "../images/musicIcon.png"
                tabName: "sound"
                tabGroup: tabGroup

            }
            DockIcon{
                icon: "../images/mouseIcon.png"
                tabName: "control"
                tabGroup: tabGroup
            }

            Rectangle{
                id: appSpacing
                color:"transparent"
                height: parent.height - (10+optionTab.height)*4
                width: parent.width
            }

            DockIcon{
                id: optionTab
                icon: "../images/optionIcon.png"
                tabName: "config"
                tabGroup: tabGroup
            }
        }



    }
}
