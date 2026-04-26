import QtQuick 2.5

Rectangle {
    id: root
    width: 1920
    height: 1080
    color: "black"

    Image {
        id: wingLeft
	source: "images/load_roulette_bars.png"
	mirror: true
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
	anchors.horizontalCenterOffset: -440 
	height: root.height * 0.35
	width: height
	fillMode: Image.PreserveAspectFit
        opacity: 0.8
        z: 1
    }

    Image {
        id: wingRight
        source: "images/load_roulette_bars.png"
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
	anchors.horizontalCenterOffset: 440
        height: root.height * 0.35
        width: height	
        fillMode: Image.PreserveAspectFit
        opacity: 0.8
        z: 1
    }

    Item {
        id: mainContainer
        width: 500
        height: 500
        anchors.centerIn: parent
        z: 2

        Image {
            id: wheel
            source: "images/load_roulette_wheel.png"
            anchors.fill: parent
            smooth: true
            RotationAnimation on rotation {
                from: 0; to: 360; duration: 8000; loops: Animation.Infinite; running: true
            }
        }

        Item {
            id: ballContainer
            anchors.fill: parent
            RotationAnimation on rotation {
                from: 360; to: 0; duration: 3500; loops: Animation.Infinite; running: true
            }
            Image {
                id: ball
                source: "images/load_roulette_ball.png"
                width: 100
		height: 100
		fillMode: Image.PreserveAspectFit
                anchors.horizontalCenter: parent.horizontalCenter
		y: 35
                smooth: true
		antialiasing: true
		mipmap: true
		layer.enabled: true
		layer.effect: null
		opacity: 0.9
            }
        }
    }

    Text {
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 50
        anchors.horizontalCenter: parent.horizontalCenter
        text: "PLEASE STAND BY..."
        color: "#ffb642"
        font.family: "Monospace"
        font.pixelSize: 22
        
        SequentialAnimation on opacity {
            loops: Animation.Infinite
            NumberAnimation { from: 1; to: 0.4; duration: 800 }
            NumberAnimation { from: 0.4; to: 1; duration: 800 }
        }
    }
}    
