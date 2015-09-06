import QtQuick 2.0

Rectangle {
    id: root
    height: parent.height
    width: parent.width-20
    x: 10

    gradient: Gradient {
                GradientStop {position: 0; color: "#1e1e2a";}
                GradientStop {position: 1;color: "#01010b";}
            }


}

