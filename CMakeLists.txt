cmake_minimum_required(VERSION 3.16)
project(SobelCam-Qt LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTORCC ON)

find_package(QT NAMES Qt6 Qt5 REQUIRED COMPONENTS Core Gui Widgets Multimedia)
find_package(Qt${QT_VERSION_MAJOR} REQUIRED COMPONENTS Core Gui Widgets Multimedia)

find_package(OpenMP)

set(SOURCES
    main.cpp
    MainWindow.cpp
    cpp/Image.cpp
)

set(HEADERS
    MainWindow.h
    ProcessorWorker.h
    h/Image.h
    h/stb_image.h
    h/stb_image_write.h
)

add_executable(SobelCam-Qt ${SOURCES} ${HEADERS})

target_include_directories(SobelCam-Qt PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${CMAKE_CURRENT_SOURCE_DIR}/h
)

target_link_libraries(SobelCam-Qt PRIVATE
    Qt${QT_VERSION_MAJOR}::Core
    Qt${QT_VERSION_MAJOR}::Gui
    Qt${QT_VERSION_MAJOR}::Widgets
    Qt${QT_VERSION_MAJOR}::Multimedia
)

if(OpenMP_CXX_FOUND)
    target_link_libraries(SobelCam-Qt PRIVATE OpenMP::OpenMP_CXX)
endif()
