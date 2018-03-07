import QtQuick 2.9

Item {
    function start(seconds) {
        photoTimer.interval = seconds * 1000
        photoTimer.start()
    }

    Rectangle {
        anchors.fill: parent
        color: "black"
    }

    Image {
        id: image
        anchors.fill: parent
        fillMode: Image.PreserveAspectFit
    }

    Timer {
        id: photoTimer
        running: false
        triggeredOnStart: true
        interval: 2000
        repeat: true
        onTriggered: {
            var imagePath = PhotoList.nextImage()
            image.source = imagePath
        }
    }
}
