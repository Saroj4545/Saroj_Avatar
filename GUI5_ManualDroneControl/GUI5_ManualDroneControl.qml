import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

ApplicationWindow {
    visible: true
    width: 1200
    height: 800
    title: "Avatar - Manual Drone Control"

    // Manual Drone Control view
    Rectangle {
        color: "#3b4b57" // background color
        Layout.fillWidth: true
        Layout.fillHeight: true
        anchors.fill: parent


        ColumnLayout {
            anchors.fill: parent
            spacing: 5

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
                            // Define the vertical scroll bar

                        }
                        ScrollBar.vertical: ScrollBar {
                            width: 10
                            policy: ScrollBar.AlwaysOn

                            // Customize the appearance of the scrollbar's indicator
                            // indicator: Rectangle {
                            //     color: "#6e6e6e"
                            //     border.color: "#4a4a4a"
                            //     radius: 5
                            //     width: 10  // The width of the scrollbar handle
                            // }
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
}
