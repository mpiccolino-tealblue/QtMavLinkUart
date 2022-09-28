QT += quick

QMAKE_CXXFLAGS += -std=c++0x
QMAKE_CXXFLAGS += -pthread
LIBS += -pthread

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        main.cpp \
        uart/mavlink_control.cpp \
        uart/autopilot_interface.cpp \
        uart/serial_port.cpp \
        uart/udp_port.cpp

RESOURCES += qml.qrc

HEADERS += \
    uart/mavlink_control.h \
    uart/autopilot_interface.h \
    uart/serial_port.h \
    uart/udp_port.h \
    uart/generic_port.h \
    uart/mavlink/include/AGU/AGU_MAVLINK/*mavlink_conversions.h \
    uart/mavlink/include/AGU/mavlink_conversions.h \
    uart/mavlink/include/AGU/mavlink_get_info.h \
    uart/mavlink/include/AGU/mavlink_helpers.h \
    uart/mavlink/include/AGU/mavlink_sha256.h \
    uart/mavlink/include/AGU/mavlink_types.h \
    uart/mavlink/include/AGU/message.hpp \
    uart/mavlink/include/AGU/msgmap.hpp \
    uart/mavlink/include/AGU/protocol.h\
    uart/mavlink/include/AGU/common/* \
    uart/mavlink/include/AGU/minimal/*\
    uart/mavlink/include/AGU/AGU/AGU_MAVLINK/*
# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target
