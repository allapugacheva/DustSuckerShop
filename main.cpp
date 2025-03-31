#include <QApplication>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include <QQmlContext>
#include "FileUploader.h"
#include "FileDialogHelper.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    QQuickStyle::setStyle("Basic");

    QQmlApplicationEngine engine;
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);

    FileUploader fileUploader;
    engine.rootContext()->setContextProperty("fileUploader", &fileUploader);

    FileDialogHelper fileDialogHelper;
    engine.rootContext()->setContextProperty("fileDialogHelper", &fileDialogHelper);

    engine.loadFromModule("DustSuckerShop", "Main");

    return app.exec();
}
