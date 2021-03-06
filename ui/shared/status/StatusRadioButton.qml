import QtQuick 2.13
import QtQuick.Controls 2.13
import QtQml 2.14
import "../../imports"
import "../../shared"

RadioButton {
    id: control
    indicator: Rectangle {
        implicitWidth: 20
        implicitHeight: 20
        x: control.leftPadding
        y: 4
        radius: 10
        color: control.checked ? Style.current.blue : Style.current.grey

        Rectangle {
            width: 12
            height: 12
            radius: 6
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            color: control.checked ? Style.current.white : Style.current.grey
            visible: control.checked
        }
    }
    contentItem: StyledText {
        text: control.text
        color: Style.current.textColor
        leftPadding: control.indicator.width + control.spacing
    }
}
