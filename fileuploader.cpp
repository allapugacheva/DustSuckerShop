#include "FileUploader.h"
#include <QFile>
#include <QDebug>
#include <QHttpPart>

FileUploader::FileUploader(QObject *parent) : QObject(parent) {}

void FileUploader::uploadFile(const QString &filePath) {
    QUrl url("https://dustsuckerimageapi.onrender.com"); // URL сервера

    QFile *file = new QFile(filePath);
    if (!file->open(QIODevice::ReadOnly)) {
        emit uploadError("Ошибка открытия файла!");
        return;
    }

    QHttpMultiPart *multiPart = new QHttpMultiPart(QHttpMultiPart::FormDataType);
    QHttpPart filePart;

    filePart.setHeader(QNetworkRequest::ContentDispositionHeader, QVariant("form-data; name=\"file\"; filename=\"" + file->fileName() + "\""));
    filePart.setHeader(QNetworkRequest::ContentTypeHeader, QVariant("image/"));
    filePart.setBodyDevice(file);
    file->setParent(multiPart);  // Файл будет удалён вместе с multipart

    multiPart->append(filePart);

    QNetworkRequest request(url);
    QNetworkReply *reply = manager.post(request, multiPart);
    multiPart->setParent(reply);  // Удаляется автоматически после запроса

    connect(reply, &QNetworkReply::finished, this, [this, reply]() {
        if (reply->error() == QNetworkReply::NoError) {
            emit uploadFinished(reply->readAll());
        } else {
            emit uploadError(reply->errorString());
        }
        reply->deleteLater();
    });
}
