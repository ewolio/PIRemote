import QtQuick 2.0

Panel {
    MouseArea{
        anchors.fill: parent;

        onClicked: {
            xdotool.trigger("click");
            previousX = mouseX;
            previousY = mouseY;
        }

        property real previousX: 0
        property real previousY: 0
        onMouseXChanged:{
            if(mouseX - previousX>5 || previousX - mouseX >5){
                if(mouseX - previousX<50 || previousX - mouseX <50)
                    xdotool.trigger("moveMouseRelative", (mouseX-previousX)+" 0");

                previousX = mouseX;
            }
        }
        onMouseYChanged:{
            if(mouseY - previousY>5 || previousY - mouseY >5){
                if(mouseY - previousY<50 || previousY - mouseY <50)
                    xdotool.trigger("moveMouseRelative", "0 "+(mouseY-previousY));

                previousY = mouseY;
            }
        }

    }
}

