TEMPLATE = app

QT += qml quick widgets network

SOURCES += main.cpp \
    remoteapp.cpp \
    piremote.cpp

RESOURCES += qml.qrc

target.path = /home/pi

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

DISTFILES +=

HEADERS += \
    remoteapp.h \
    piremote.h
