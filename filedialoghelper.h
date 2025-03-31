#ifndef FILEDIALOGHELPER_H
#define FILEDIALOGHELPER_H

#include <QObject>
#include <QtWidgets/QFileDialog>

class FileDialogHelper : public QObject {
    Q_OBJECT
public:
    explicit FileDialogHelper(QObject *parent = nullptr) : QObject(parent) {}

    Q_INVOKABLE QString openFileDialog() {
        return QFileDialog::getOpenFileName(nullptr, "Выберите файл", "", "Изображения (*.png *.jpg)",  nullptr, QFileDialog::DontUseNativeDialog);
    }
};

#endif // FILEDIALOGHELPER_H
