import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

ApplicationWindow {
    visible: true
    width: 1400
    height: 800
    title: "Avatar - Project"

    ColumnLayout {
        anchors.fill: parent
        spacing: 10

        // Tab bar
        TabBar {
            id: tabBar
            Layout.fillWidth: true
            height: 40

            TabButton {
                text: "Brainwave Reading"
                onClicked: stackLayout.currentIndex = 0
            }
            TabButton {
                text: "Transfer Data"
                onClicked: stackLayout.currentIndex = 1
            }
            TabButton {
                text: "Manual Drone Control"
                onClicked: stackLayout.currentIndex = 2
            }
        }

        // Stack layout for different views
        StackLayout {
            id: stackLayout
            Layout.fillWidth: true
            Layout.fillHeight: true

            // Brainwave Reading view
            Rectangle {
                color: "#3b4b57" // Background color
                Layout.fillWidth: true
                Layout.fillHeight: true

                RowLayout {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    spacing: 20

                    // Left Column (Components)
                    ColumnLayout {
                        Layout.preferredWidth: 600
                        Layout.fillHeight: true
                        spacing: 10

                        // Control Mode
                        RowLayout {
                            Layout.alignment: Qt.AlignHCenter
                            spacing: 10
                            RadioButton {
                                text: "Manual Control"
                                checked: true
                            }
                            RadioButton {
                                text: "Autopilot"
                            }
                        }

                        // Brainwave Image with Transparent Button
                        Rectangle {
                            width: 150
                            height: 150
                            color: "#1b3a4b" // Dark blue background
                            Layout.alignment: Qt.AlignHCenter

                            Image {
                                source: "images/brain.png"
                                width: 130
                                height: 130
                                anchors.centerIn: parent
                                fillMode: Image.PreserveAspectFit
                            }

                            Button {
                                width: 130
                                height: 130
                                anchors.centerIn: parent
                                background: Item {} // No background
                                contentItem: Text {
                                    text: "Read my mind..."
                                    color: "white" // Set text color to white
                                    anchors.centerIn: parent
                                }
                                onClicked: backend.readMyMind()
                            }
                        }

                        // Model Prediction Section
                        Label {
                            text: "The model says ..."
                            color: "white"
                            Layout.alignment: Qt.AlignHCenter
                        }

                        GroupBox {
                            Layout.preferredWidth: 300
                            Layout.preferredHeight: 80
                            Layout.alignment: Qt.AlignHCenter

                            // Header with white background
                            RowLayout {
                                spacing: 1
                                Rectangle {
                                    color: "white"
                                    width: 145
                                    height: 20
                                    Text {
                                        text: "Count"
                                        font.bold: true
                                        color: "black"
                                        anchors.centerIn: parent
                                    }
                                }
                                Rectangle {
                                    color: "white"
                                    width: 145
                                    height: 20
                                    Text {
                                        text: "Label"
                                        font.bold: true
                                        color: "black"
                                        anchors.centerIn: parent
                                    }
                                }
                            }


                            ListView {
                                id: predictionListView
                                Layout.fillWidth: true
                                Layout.fillHeight: true
                                model: ListModel {}
                                delegate: RowLayout {
                                    spacing: 150
                                    Text { text: model.count; color: "white"; width: 80 }
                                    Text { text: model.label; color: "white"; width: 80 }
                                }
                            }

                        }

                        // Action Buttons
                        RowLayout {
                            spacing: 10
                            Layout.alignment: Qt.AlignHCenter
                            Button {
                                text: "Not what I was thinking..."
                                Layout.preferredWidth: 160
                                Layout.preferredHeight: 80
                                background: Rectangle {
                                    color: "#1b3a4b"
                                }
                                onClicked: backend.notWhatIWasThinking(manualInput.text)
                            }
                            Button {
                                text: "Execute"
                                Layout.preferredWidth: 160
                                Layout.preferredHeight: 80
                                background: Rectangle {
                                    color: "#1b3a4b"
                                }
                                onClicked: backend.executeAction()
                            }
                        }

                        // Manual Input and Keep Alive
                        GridLayout {
                            columns: 2
                            columnSpacing: 10
                            Layout.fillWidth: true
                            Layout.alignment: Qt.AlignHCenter
                            TextField {
                                id: manualInput
                                placeholderText: "Manual Command"
                                Layout.preferredWidth: 400
                                Layout.alignment: Qt.AlignHCenter
                            }
                            Button {
                                text: "Keep Drone Alive"
                                width: 130
                                height: 40
                                background: Rectangle {
                                    color: "#1b3a4b"
                                }
                                onClicked: backend.keepDroneAlive()
                            }
                        }

                        // Flight Log
                        GroupBox {
                            title: "Flight Log"
                            Layout.preferredWidth: 230
                            Layout.preferredHeight: 170
                            ListView {
                                id: flightLogView
                                Layout.preferredWidth: 230
                                Layout.preferredHeight: 170
                                model: ListModel {}
                                delegate: Text {
                                    text: log
                                    color: "white"
                                }
                            }
                        }

                        // Connect Image with Transparent Button
                        Rectangle {
                            width: 150
                            height: 150
                            color: "#1b3a4b" // Dark blue background

                            Image {
                                source: "images/connect.png"
                                width: 80
                                height: 80
                                anchors.centerIn: parent
                                fillMode: Image.PreserveAspectFit
                            }

                            Button {
                                width: 80
                                height: 80
                                anchors.centerIn: parent
                                background: Item {} // No background
                                contentItem: Text {
                                    text: "Connect"
                                    color: "white" // Set text color to white
                                    anchors.centerIn: parent
                                }
                                onClicked: backend.connectDrone()
                            }
                        }
                    }

                    // Right Column (Prediction Table and Console Log)
                    ColumnLayout {
                        Layout.preferredWidth: 700
                        Layout.fillHeight: true
                        spacing: 10

                        // Predictions Table
                        GroupBox {
                            title: "Predictions Table"
                            Layout.preferredWidth: 700
                            Layout.preferredHeight: 550

                            // Header with white background
                            RowLayout {
                                spacing: 1
                                Rectangle {
                                    color: "white"
                                    width: 230
                                    height: 20
                                    Text {
                                        text: "Predictions Count"
                                        font.bold: true
                                        color: "black"
                                        anchors.centerIn: parent
                                    }
                                }
                                Rectangle {
                                    color: "white"
                                    width: 230
                                    height: 20
                                    Text {
                                        text: "Server Predictions"
                                        font.bold: true
                                        color: "black"
                                        anchors.centerIn: parent
                                    }
                                }
                                Rectangle {
                                    color: "white"
                                    width: 230
                                    height: 20
                                    Text {
                                        text: "Prediction Label"
                                        font.bold: true
                                        color: "black"
                                        anchors.centerIn: parent
                                    }
                                }
                            }
                            ListView {
                                Layout.preferredWidth: 700
                                Layout.preferredHeight: 550
                                model: ListModel {
                                    ListElement { count: "1"; server: "Prediction A"; label: "Label A" }
                                    ListElement { count: "2"; server: "Prediction B"; label: "Label B" }
                                }
                                delegate: RowLayout {
                                    spacing: 50
                                    Text { text: model.count; color: "white"; width: 120 }
                                    Text { text: model.server; color: "white"; width: 200 }
                                    Text { text: model.label; color: "white"; width: 120 }
                                }
                            }

                        }

                        // Console Log Section
                        GroupBox {
                            title: "Console Log"
                            Layout.preferredWidth: 300
                            Layout.preferredHeight: 250
                            Layout.alignment: Qt.AlignRight

                            TextArea {
                                id: consoleLog
                                Layout.fillWidth: true
                                Layout.fillHeight: true
                                text: "Console output here..."
                            }
                        }
                    }
                }
            }

            // Transfer Data view
            Rectangle {
                color: "#4a5b7b"
                ScrollView {
                    anchors.centerIn: parent
                    width: Math.min(parent.width * 0.9, 600)
                    height: Math.min(parent.height * 0.9, contentHeight)
                    clip: true

                    ColumnLayout {
                        id: contentLayout
                        width: parent.width
                        spacing: 10

                        Label { text: "Target IP"; color: "white" }
                        TextField { Layout.fillWidth: true }

                        Label { text: "Target Username"; color: "white" }
                        TextField { Layout.fillWidth: true }

                        Label { text: "Target Password"; color: "white" }
                        TextField {
                            Layout.fillWidth: true
                            echoMode: TextInput.Password
                        }

                        Label { text: "Private Key Directory:"; color: "white" }
                        RowLayout {
                            Layout.fillWidth: true
                            TextField {
                                id: privateKeyDirInput
                                Layout.fillWidth: true
                            }
                            Button {
                                text: "Browse"
                                onClicked: console.log("Browse for Private Key Directory")
                            }
                        }

                        CheckBox {
                            text: "Ignore Host Key"
                            checked: true
                            contentItem: Text {
                                text: parent.text
                                color: "white"
                                leftPadding: parent.indicator.width + parent.spacing
                            }
                        }

                        Label { text: "Source Directory:"; color: "white" }
                        RowLayout {
                            Layout.fillWidth: true
                            TextField {
                                id: sourceDirInput
                                Layout.fillWidth: true
                            }
                            Button {
                                text: "Browse"
                                onClicked: console.log("Browse for Source Directory")
                            }
                        }

                        Label { text: "Target Directory:"; color: "white" }
                        TextField {
                            Layout.fillWidth: true
                            text: "/home/"
                            placeholderText: "/home/"
                        }

                        RowLayout {
                            Layout.fillWidth: true
                            Button {
                                text: "Save Config"
                                onClicked: console.log("Save Config clicked")
                            }
                            Button {
                                text: "Load Config"
                                onClicked: console.log("Load Config clicked")
                            }
                            Button {
                                text: "Clear Config"
                                onClicked: console.log("Clear Config clicked")
                            }
                            Button {
                                text: "Upload"
                                onClicked: console.log("Upload clicked")
                            }
                        }
                    }
                }
            }


            // Manual Drone Control view
            Rectangle {
                color: "#3b4b57" // background color
                Layout.fillWidth: true
                Layout.fillHeight: true

                ColumnLayout {
                    anchors.fill: parent
                    spacing: 5
                    Layout.alignment: Qt.AlignHCenter

                    // Row layout home, Up, flight log, down
                    RowLayout {
                        spacing: 20
                        Layout.fillWidth: true
                        Layout.alignment: Qt.AlignHCenter

                        // Home
                        Rectangle {
                            border.width: 1
                            border.color: "white"
                            Layout.fillWidth: true
                            height: 150
                            color: "#1b3a4b" // Dark blue background

                            Image {
                                source: "images/home.png"
                                width: 80
                                height: 80
                                anchors.centerIn: parent
                                fillMode: Image.PreserveAspectFit
                            }

                            Button {
                                Layout.fillWidth: true
                                height: 130
                                anchors.centerIn: parent
                                background: Item {} // No background
                                contentItem: Text {
                                    text: "Home"
                                    color: "white"
                                    anchors.centerIn: parent
                                }
                                onClicked: manualDroneBackend.homeAction()
                            }
                        }

                        // Up Button
                        Rectangle {
                            border.width: 1
                            border.color: "white"
                            Layout.fillWidth: true
                            Layout.preferredWidth: 2
                            height: 150
                            color: "#1b3a4b" // Dark blue background
                            Layout.alignment: Qt.AlignHCenter

                            Image {
                                source: "images/up.png"
                                width: 80
                                height: 80
                                anchors.centerIn: parent
                                fillMode: Image.PreserveAspectFit
                            }

                            Button {
                                Layout.fillWidth: true
                                height: 130
                                anchors.centerIn: parent
                                background: Item {} // transparent background
                                contentItem: Text {
                                    text: "Up"
                                    color: "white"
                                    opacity: 1.0
                                    anchors.centerIn: parent
                                }
                                onClicked: manualDroneBackend.up()
                            }
                        }

                        // Flight Log
                        GroupBox {
                            title: "Flight Log"
                            Layout.preferredWidth: 400
                            Layout.preferredHeight: 170

                            Flickable {
                                id: flightLogFlickable
                                width: parent.width
                                height: parent.height  // Ensure Flickable's height matches GroupBox's height
                                contentHeight: flightLogViewManualFlightTab.contentHeight
                                clip: true


                                ColumnLayout {
                                    ListView {
                                        id: flightLogViewManualFlightTab
                                        Layout.fillWidth: true
                                        Layout.preferredHeight: 170
                                        model: ListModel { }
                                        delegate: Text {
                                            text: log
                                            color: "white"
                                        }
                                    }

                                }
                                ScrollBar.vertical: ScrollBar {
                                    width: 10
                                    policy: ScrollBar.AlwaysOn

                                }


                            }

                        }
                    }

                    // Row for Forward
                    RowLayout {
                        spacing: 20
                        Layout.fillWidth: true
                        Layout.alignment: Qt.AlignHCenter

                        // Forward Button
                        Rectangle {
                            border.width: 1
                            border.color: "white"
                            Layout.fillWidth: true
                            height: 150
                            color: "#1b3a4b" // Dark blue background

                            Image {
                                source: "images/forward.png"
                                width: 80
                                height: 80
                                anchors.centerIn: parent
                                fillMode: Image.PreserveAspectFit
                            }

                            Button {
                                Layout.fillWidth: true
                                height: 130
                                anchors.centerIn: parent
                                background: Item {} // No background
                                contentItem: Text {
                                    text: "Forward"
                                    color: "white"
                                    anchors.centerIn: parent
                                }
                                onClicked: manualDroneBackend.forward()
                            }
                        }
                    }

                    // Row for TurnLeft, Left, Stream, Right, Turn Right
                    RowLayout {
                        spacing: 20
                        Layout.fillWidth: true
                        Layout.alignment: Qt.AlignHCenter

                        // TurnLeft button
                        Rectangle {
                            border.width: 1
                            border.color: "white"
                            Layout.fillWidth: true
                            height: 150
                            color: "#1b3a4b" // Dark blue background

                            Image {
                                source: "images/turnLeft.png"
                                width: 80
                                height: 80
                                anchors.centerIn: parent
                                fillMode: Image.PreserveAspectFit
                            }

                            Button {
                                Layout.fillWidth: true
                                height: 130
                                anchors.centerIn: parent
                                background: Item {} // No background
                                contentItem: Text {
                                    text: "Turn Left"
                                    color: "white"
                                    anchors.centerIn: parent
                                }
                                onClicked: manualDroneBackend.turnLeft()
                            }
                        }

                        // Left
                        Rectangle {
                            border.width: 1
                            border.color: "white"
                            Layout.fillWidth: true
                            height: 150
                            color: "#1b3a4b" // Dark blue background

                            Image {
                                source: "images/left.png"
                                width: 80
                                height: 80
                                anchors.centerIn: parent
                                fillMode: Image.PreserveAspectFit
                            }

                            Button {
                                Layout.fillWidth: true
                                height: 130
                                anchors.centerIn: parent
                                background: Item {} // No background
                                contentItem: Text {
                                    text: "Left"
                                    color: "white"
                                    anchors.centerIn: parent
                                }
                                onClicked: manualDroneBackend.left()
                            }
                        }

                        // Stream Button
                        Rectangle {
                            border.width: 1
                            border.color: "white"
                            Layout.fillWidth: true
                            height: 150
                            color: "#1b3a4b" // Dark blue background

                            Image {
                                source: "images/drone.png"
                                width: 80
                                height: 80
                                anchors.centerIn: parent
                                fillMode: Image.PreserveAspectFit
                            }

                            Button {
                                Layout.fillWidth: true
                                height: 130
                                anchors.centerIn: parent
                                background: Item {} // No background
                                contentItem: Text {
                                    text: "Stream"
                                    color: "white"
                                    anchors.centerIn: parent
                                }
                                onClicked: console.log("Stream button clicked")
                            }
                        }

                        // Right
                        Rectangle {
                            border.width: 1
                            border.color: "white"
                            Layout.fillWidth: true
                            height: 150
                            color: "#1b3a4b" // Dark blue background

                            Image {
                                source: "images/right.png"
                                width: 80
                                height: 80
                                anchors.centerIn: parent
                                fillMode: Image.PreserveAspectFit
                            }

                            Button {
                                Layout.fillWidth: true
                                height: 130
                                anchors.centerIn: parent
                                background: Item {} // No background
                                contentItem: Text {
                                    text: "Right"
                                    color: "white"
                                    anchors.centerIn: parent
                                }
                                onClicked: manualDroneBackend.right()
                            }
                        }

                        // TurnRight button
                        Rectangle {
                            border.width: 1
                            border.color: "white"
                            Layout.fillWidth: true
                            height: 150
                            color: "#1b3a4b" // Dark blue background

                            Image {
                                source: "images/turnRight.png"
                                width: 80
                                height: 80
                                anchors.centerIn: parent
                                fillMode: Image.PreserveAspectFit
                            }

                            Button {
                                Layout.fillWidth: true
                                height: 130
                                anchors.centerIn: parent
                                background: Item {} // No background
                                contentItem: Text {
                                    text: "Turn Right"
                                    color: "white"
                                    anchors.centerIn: parent
                                }
                                onClicked: manualDroneBackend.turnRight()
                            }
                        }
                    }

                    // Row for Back
                    RowLayout {
                        spacing: 20
                        Layout.fillWidth: true
                        Layout.alignment: Qt.AlignHCenter

                        // Back Button
                        Rectangle {
                            border.width: 1
                            border.color: "white"
                            Layout.fillWidth: true
                            height: 150
                            color: "#1b3a4b" // Dark blue background

                            Image {
                                source: "images/back.png"
                                width: 80
                                height: 80
                                anchors.centerIn: parent
                                fillMode: Image.PreserveAspectFit
                            }

                            Button {
                                Layout.fillWidth: true
                                height: 130
                                anchors.centerIn: parent
                                background: Item {} // No background
                                contentItem: Text {
                                    text: "Back"
                                    color: "white"
                                    anchors.centerIn: parent
                                }
                                onClicked: manualDroneBackend.back()
                            }
                        }
                    }

                    // Row for Connect, Down, Take Off, Land
                    RowLayout {
                        spacing: 20
                        Layout.fillWidth: true
                        Layout.alignment: Qt.AlignHCenter

                        // Connect
                        Rectangle {
                            border.width: 1
                            border.color: "white"
                            Layout.fillWidth: true
                            height: 150
                            color: "#1b3a4b" // Dark blue background

                            Image {
                                source: "images/connect.png"
                                width: 80
                                height: 80
                                anchors.centerIn: parent
                                fillMode: Image.PreserveAspectFit
                            }

                            Button {
                                Layout.fillWidth: true
                                height: 130
                                anchors.centerIn: parent
                                background: Item {} // No background
                                contentItem: Text {
                                    text: "Connect"
                                    color: "white"
                                    anchors.centerIn: parent
                                }
                                onClicked: manualDroneBackend.connect()
                            }
                        }

                        // Down Button
                        Rectangle {
                            border.width: 1
                            border.color: "white"
                            Layout.fillWidth: true
                            Layout.preferredWidth: 2
                            height: 150
                            color: "#1b3a4b" // Dark blue background
                            Layout.alignment: Qt.AlignHCenter

                            Image {
                                source: "images/down.png"
                                width: 80
                                height: 80
                                anchors.centerIn: parent
                                fillMode: Image.PreserveAspectFit
                            }

                            Button {
                                Layout.fillWidth: true
                                height: 130
                                anchors.centerIn: parent
                                background: Item {} // No background
                                contentItem: Text {
                                    text: "Down"
                                    color: "white"
                                    anchors.centerIn: parent
                                }
                                onClicked: manualDroneBackend.down()
                            }
                        }

                        // Take Off
                        Rectangle {
                            border.width: 1
                            border.color: "white"
                            Layout.fillWidth: true
                            height: 150
                            color: "#1b3a4b" // Dark blue background

                            Image {
                                source: "images/takeoff.png"
                                width: 80
                                height: 80
                                anchors.centerIn: parent
                                fillMode: Image.PreserveAspectFit
                            }

                            Button {
                                Layout.fillWidth: true
                                height: 130
                                anchors.centerIn: parent
                                background: Item {} // No background
                                contentItem: Text {
                                    text: "Take Off"
                                    color: "white"
                                    anchors.centerIn: parent
                                }
                                onClicked: manualDroneBackend.takeOff()
                            }
                        }

                        // Land
                        Rectangle {
                            border.width: 1
                            border.color: "white"
                            Layout.fillWidth: true
                            height: 150
                            color: "#1b3a4b" // Dark blue background

                            Image {
                                source: "images/land.png"
                                width: 80
                                height: 80
                                anchors.centerIn: parent
                                fillMode: Image.PreserveAspectFit
                            }

                            Button {
                                Layout.fillWidth: true
                                height: 130
                                anchors.centerIn: parent
                                background: Item {} // No background
                                contentItem: Text {
                                    text: "Land"
                                    color: "white"
                                    anchors.centerIn: parent
                                }
                                onClicked: manualDroneBackend.land()
                            }
                        }
                    }

                }
            }
        }
        // Update the flight log when the backend signal is emitted
        Connections {
            target: manualDroneBackend

            function onFlightLogUpdated(updatedLog)
            {
                // console.log("Flight Logs on manual drone tab from backend", JSON.stringify(updatedLog))

                // Clear the current model (optional)
                flightLogViewManualFlightTab.model.clear()

                // Add each log entry from the updated flight log
                for (var i = 0; i < updatedLog.length; i++) {

                    flightLogViewManualFlightTab.model.append({ log: updatedLog[i] })
                }
            }
        }
    }
}
