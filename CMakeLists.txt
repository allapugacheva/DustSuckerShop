cmake_minimum_required(VERSION 3.16)

project(DustSuckerShop VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.5 REQUIRED COMPONENTS Quick QuickControls2)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(appDustSuckerShop
    main.cpp
)

qt_add_qml_module(appDustSuckerShop
    URI DustSuckerShop
    VERSION 1.0
    QML_FILES
        Main.qml
        QML_FILES HooverListItem.qml
        QML_FILES Heart.qml
        QML_FILES Star.qml
        QML_FILES OrangeButton.qml
        QML_FILES CheckBoxList.qml
        QML_FILES OrangeCheckBox.qml
        QML_FILES OrangeDoubleSlider.qml
        QML_FILES MenuBar.qml
        QML_FILES OrangeComboBox.qml
        QML_FILES Style.qml
        QML_FILES MainWindow.qml
        QML_FILES RegistrationWindow.qml
        QML_FILES ExtendedHooverListItem.qml
        QML_FILES WishlistWindow.qml
        QML_FILES FinishBuyItem.qml
        QML_FILES HooverCartItem.qml
        QML_FILES OrangeCounter.qml
        QML_FILES CartWindow.qml
        QML_FILES HooverDetailWindow.qml
        QML_FILES ScrollableImage.qml
        QML_FILES Comment.qml
        QML_FILES AddHooverWindow.qml
        QML_FILES OrangeTextInput.qml
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appDustSuckerShop PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appDustSuckerShop
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appDustSuckerShop
    PRIVATE Qt6::Quick Qt6::qtgraphicaleffectsplugin Qt6::QuickControls2
)

include(GNUInstallDirs)
install(TARGETS appDustSuckerShop
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
