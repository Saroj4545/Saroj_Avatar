# This Python file uses the following encoding: utf-8
import sys
import os
from pathlib import Path
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine
from PySide6.QtCore import QObject, Signal, Slot

class ManualDroneControlBackend(QObject):
    # Define signals to update QML components
    flightLogUpdated = Signal(list)

    def __init__(self):
        super().__init__()
        self.flight_log = []  # List to store flight log entries

    @Slot()
    def homeAction(self):
        self.flight_log.insert(0, "Home button pressed")
        self.flightLogUpdated.emit(self.flight_log)


    @Slot()
    def forward(self):
        # Mock function to simulate right button
        self.flight_log.insert(0, "Forward button pressed")
        self.flightLogUpdated.emit(self.flight_log)

    @Slot()
    def up(self):
        # Mock function to simulate up button
        self.flight_log.insert(0, "Up button pressed")
        self.flightLogUpdated.emit(self.flight_log)
    
    @Slot()
    def turnLeft(self):
        # Mock function to simulate turn left button
        self.flight_log.insert(0, "Turn left button pressed")
        self.flightLogUpdated.emit(self.flight_log)
    
    @Slot()
    def left(self):
        # Mock function to simulate left button
        self.flight_log.insert(0, "Left button pressed")
        self.flightLogUpdated.emit(self.flight_log)
        
    @Slot()
    def right(self):
        # Mock function to simulate right button
        self.flight_log.insert(0, "Right button pressed")
        self.flightLogUpdated.emit(self.flight_log)
            
    @Slot()
    def turnRight(self):
        # Mock function to simulate turn right button
        self.flight_log.insert(0, "Turn right button pressed")
        self.flightLogUpdated.emit(self.flight_log)
    
                
    @Slot()
    def back(self):
        # Mock function to simulate back button
        self.flight_log.insert(0, "Back button pressed")
        self.flightLogUpdated.emit(self.flight_log)
        
    @Slot()
    def connect(self):
        # Mock function to simulate connect button
        self.flight_log.insert(0, "Drone connect button pressed")
        self.flightLogUpdated.emit(self.flight_log)
        
    @Slot()
    def down(self):
        # Mock function to simulate down button
        self.flight_log.insert(0, "Down button pressed")
        self.flightLogUpdated.emit(self.flight_log)
        
    @Slot()
    def takeOff(self):
        # Mock function to simulate take off button
        self.flight_log.insert(0, "Take offbutton pressed")
        self.flightLogUpdated.emit(self.flight_log)
        
    @Slot()
    def land(self):
        # Mock function to simulate land button
        self.flight_log.insert(0, "Land button pressed")
        self.flightLogUpdated.emit(self.flight_log)
    

        
if __name__ == "__main__":
    # Set the Quick Controls style to "Fusion"
    os.environ["QT_QUICK_CONTROLS_STYLE"] = "Fusion"

    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()

    # Load the QML file
    qml_file = Path(__file__).resolve().parent / "GUI5_ManualDroneControl.qml"

    # Check if the QML file exists
    if not qml_file.exists():
        sys.exit(-1)

    # Load the QML file
    engine.load(str(qml_file))

    # Check if the QML engine loaded successfully
    if not engine.rootObjects():
        sys.exit(-1)
    
    # Create and set the manualDroneBackend context
    manualDroneBackend = ManualDroneControlBackend()
    engine.rootContext().setContextProperty("manualDroneBackend", manualDroneBackend)

    sys.exit(app.exec())
