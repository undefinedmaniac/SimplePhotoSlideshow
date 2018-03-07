#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "photolist.h"

int main(int argc, char *argv[])
{
#if defined(Q_OS_WIN)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);

    PhotoList photoList;

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    QQmlContext *context = engine.rootContext();
    context->setContextProperty("PhotoList", &photoList);

    return app.exec();
}
