pragma Singleton
import QtQuick

QtObject {
    id: globalData

    property string userEmail: ""
    property bool isLogged: false
}
