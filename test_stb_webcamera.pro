QT       += core gui multimedia

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

QMAKE_CXXFLAGS += -fopenmp
LIBS += -fopenmp

CONFIG += c++17

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    cpp/Image.cpp \
    main.cpp \
    MainWindow.cpp

HEADERS += \
    MainWindow.h \
    ProcessorWorker.h \
    h/Image.h \
    h/stb_image.h \
    h/stb_image_write.h

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target
