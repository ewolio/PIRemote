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


    Connections{
        target: remoteInterface
        onDisconnected:{
            optionTab.action.checked=true;
        }
        onConnected:{
            homeTab.action.checked=true;
        }
    }



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
               PropertyChanges{target: homePanel; visible: true}
               PropertyChanges{target: soundPanel; visible: false}
               PropertyChanges{target: controlPanel;  visible: false}
            },
        State{
               name: "sound"
               PropertyChanges{target: homePanel;  visible: false}
               PropertyChanges{target: soundPanel;  visible: true}
               PropertyChanges{target: controlPanel;  visible: false}
            },
        State{
               name: "control"
               PropertyChanges{target: homePanel;  visible: false}
               PropertyChanges{target: soundPanel; visible: false}
               PropertyChanges{target: controlPanel; visible: true}
            },
        State{
               name: "config"
               PropertyChanges{target: homePanel;  visible: false}
               PropertyChanges{target: soundPanel;  visible: false}
               PropertyChanges{target: controlPanel;  visible: false}
            }
        ]


        transitions:[
            Transition{

            }

        ]
    }

    ExclusiveGroup{
        id: tabGroup
        onCurrentChanged:{
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
                id:  homeTab
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
