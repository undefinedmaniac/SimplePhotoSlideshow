import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2

Window {
    id: window

    property int seconds

    visible: true
    width: 640
    height: 480
    title: qsTr("Simple Photo Slideshow")

    FocusScope {
        anchors.fill: parent
        focus: true

        Loader {
            id: mainLoader
            anchors.fill: parent
            source: "qrc:/Settings.qml"
        }

        Connections {
            target: mainLoader.item
            ignoreUnknownSignals: true
            onStartApplication: {
                window.seconds = seconds
                fileDialog.open()
            }
        }

        FileDialog {
            id: fileDialog
            title: "Select the directory that contains your images"
            folder: shortcuts.pictures
            selectFolder: true
            selectMultiple: false
            onAccepted: {
                mainLoader.source = "qrc:/ImageViewer.qml"
                PhotoList.processDirectory(fileDialog.fileUrl)
                mainLoader.item.start(window.seconds)
            }
            onRejected: Qt.quit()
        }

        Keys.onPressed: {
            if (event.key == Qt.Key_Escape) {
                window.showNormal()
                event.accepted = true
            } else if (event.key == Qt.Key_F11) {
                window.showFullScreen()
                event.accepted = true
            }
        }
    }
}
