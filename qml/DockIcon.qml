import QtQuick 2.0
import QtGraphicalEffects 1.0

Rectangle {
    id: root
    width: parent.width
    height: parent.width
    //clip: true;
    color: "white"
    LinearGradient{

        start: Qt.point(parent.x,0)
        end: Qt.point(800-parent.x,0)
        gradient: Gradient {
                  GradientStop {position: 0; color: "#1e1e2a";}
                  GradientStop {position: 1;color: "#01010b";}
                  }

        source: Image{source: "../images/sideIconBack.png"}
    }
}

