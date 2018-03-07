import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Simple Photo Slideshow")

    Image {
        id: image
        anchors.fill: parent
    }

    Timer {
        id: photoTimer
        running: false
        triggeredOnStart: true
        interval: 2000
        repeat: true
        onTriggered: {
            image.source = PhotoList.nextImage()
        }
    }

    FileDialog {
        id: fileDialog
        title: "Select the directory that contains your images"
        folder: shortcuts.pictures
        selectFolder: true
        selectMultiple: false
        onAccepted: {
            PhotoList.processDirectory(fileDialog.fileUrl)
            photoTimer.start()
        }
        onRejected: Qt.quit()
    }

    Component.onCompleted: fileDialog.open()
}
