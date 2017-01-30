import QtQuick          2.7
import QtQuick.Controls 1.4
import QtQuick.Layouts  1.3

import QuickQanava 2.0 as Qan

Qan.Navigable {
    id: navigable
    clip: true
    RowLayout {
        anchors.top: navigable.top
        anchors.horizontalCenter: navigable.horizontalCenter
        width: navigable.width / 2
        Slider {
            id: zoomSlider
            Layout.fillWidth: true
            maximumValue: navigable.zoomMax > 0. ? navigable.zoomMax : 10.
            minimumValue: navigable.zoomMin
            value: navigable.zoom
            onValueChanged: { navigable.zoom = value }
        }
        CheckBox {
            checked: navigable.zoomOrigin == Item.Center
            text: "Zoom on view center"
            onCheckedChanged: {
                navigable.zoomOrigin = checked ? Item.Center : Item.TopLeft
            }
        }
        CheckBox {
            checked: navigable.autoFitMode == Qan.Navigable.AutoFit
            text: "AutoFit"
            onCheckedChanged: {
                navigable.autoFitMode = checked ? Qan.Navigable.AutoFit : Qan.Navigable.NoAutoFit
            }
        }
        Button {
            text: "Fit in view"
            onClicked: navigable.fitInView()
        }
    }
    Image {
        parent: navigable.containerItem
        id: imageRenderer
        smooth: true
        antialiasing: true
        fillMode: Image.PreserveAspectFit
        source:  "qrc:/image.jpg"
    }
}
