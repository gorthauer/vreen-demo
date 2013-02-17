import QtQuick 2.0
import com.vk.api 1.0
import "components"
import QtDesktop 1.0
import QtQuick.Window 2.0

PageStackWindow {
    id: app

    Component.onCompleted: client.connectToHost()

    initialPage: sideBar.currentItem
    sideBar: sideBar
    width: 1024
    height: 800
    visible: true
    title: qsTr("Vreen demo client - %1").arg(pageStack.currentPage ? pageStack.currentPage.title : qsTr("unknown"))

    SideBar {
        id: sideBar

        anchors.fill: parent

        currentItem: newsPage
        items: [
            NewsPage { id: newsPage },
            ProfilePage { id: myProfilePage; title: qsTr("Profile") },
            FriendsPage {},
            DialogsPage { id: dialogsPage },
            AudioPage { id: audioPage }
        ]
    }

    Item {
        id: backItem

        visible: false

        Text {
            text: pageStack.currentPage.title
            anchors {
                left: parent.left
                margins: 2*mm
                verticalCenter: parent.verticalCenter
            }
        }

        Button {
            id: backButton

            onClicked: pageStack.pop()

            text: qsTr("Back")

            anchors {
                right: parent.right
                top: parent.top
                bottom: parent.bottom
                margins: mm
            }
        }
    }

    //subpages
    PostPage { id: postPage }
    ProfilePage {
        id: profilePage
        header: backItem
    }

    Client {
        id: client
        connection: conn

        onOnlineChanged: {
            if (online && pageStack.currentPage) {
                pageStack.currentPage.update();
                roster.sync();
            }
        }
    }

    OAuthConnection {
        id: conn

        Component.onCompleted: {
            setConnectionOption(Connection.ShowAuthDialog, true);
            setConnectionOption(Connection.KeepAuthData, true);
        }

        clientId: 3220807
        displayType: OAuthConnection.Popup
    }
}
