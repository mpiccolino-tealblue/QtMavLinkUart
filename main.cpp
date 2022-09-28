#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "uart/mavlink_control.cpp"


int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    try
    {
        int result = top(argc,argv);
        return result;
    }

    catch ( int error )
    {
        fprintf(stderr,"mavlink_control threw exception %i \n" , error);
        return error;
    }

    return app.exec();
}
