import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

Item {
    signal startApplication(var seconds)

    id: root

    ColumnLayout {
        anchors.fill: parent

        RowLayout {
            Layout.fillWidth: true
            Layout.preferredHeight: 50
            Layout.alignment: Qt.AlignTop

            Text {
                text: "Time Between Photos"
                font.pixelSize: 15
            }

            TextField {
                id: timeField
                text: "2"
                validator: IntValidator {}
            }
        }

        Button {
            Layout.fillWidth: true
            Layout.preferredHeight: 50
            Layout.alignment: Qt.AlignRight | Qt.AlignBottom

            onPressed: {
                buttonBackground.color = "lightGreen"
            }

            onReleased: {
                buttonBackground.color = "green"
            }

            onClicked: root.startApplication(timeField.text)

            background: Rectangle {
                id: buttonBackground
                color: "green"

                Text {
                    anchors.centerIn: parent

                    text: "Go!"
                    font.pixelSize: 15
                }
            }
        }
    }
}

