import QtQuick 2.0
import com.vk.api 1.0
import "../components"
import "../attachments" as Attach
import "../Utils.js" as Utils

ImageItemDelegate {
    width: ListView.view.width

    Component.onCompleted: {
        from.update();
        if (owner)
            owner.update();
    }

    imageSource: from.photoSource

    Text {
        id: titleLabel
        width: parent.width
        font.bold: true
        text: Utils.contactLabel(from, owner)
        elide: Text.ElideRight
        wrapMode: Text.Wrap
        maximumLineCount: 2
    }

    Text {
        id: descriptionLabel
        width: parent.width
        text: body
        elide: Text.ElideRight
        wrapMode: Text.Wrap
        maximumLineCount: 6
    }

    Attach.Photo {
        model: attachments[Attachment.Photo]
    }

    Text {
        id: dateLabel

        color: systemPalette.dark
        font.pointSize: 7

        text: Utils.formatDate(date)
    }
}
