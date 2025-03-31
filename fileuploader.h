#ifndef FILEUPLOADER_H
#define FILEUPLOADER_H

#include <QObject>
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QHttpMultiPart>

class FileUploader : public QObject {
    Q_OBJECT
public:
    explicit FileUploader(QObject *parent = nullptr);
    Q_INVOKABLE void uploadFile(const QString &filePath);

signals:
    void uploadFinished(QString response);
    void uploadError(QString error);

private:
    QNetworkAccessManager manager;
};

#endif // FILEUPLOADER_H
