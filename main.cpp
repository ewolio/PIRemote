#include <QApplication>
#include <QtQuick>

#include "piremote.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);



    QQmlApplicationEngine *engine = new QQmlApplicationEngine();

    PIRemote::initRemote(engine);
    engine->rootContext()->setContextProperty("remoteInterface", PIR->interface());

    QQmlComponent component(engine, QUrl(QStringLiteral("qrc:/main.qml")));
    component.create(engine->rootContext());

    return app.exec();
}
