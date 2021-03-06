TEMPLATE = app
TARGET = phantomjs
QT += network webkit
CONFIG += console

DESTDIR = ../bin

RESOURCES = phantomjs.qrc

HEADERS += csconverter.h \
    phantom.h \
    callback.h \
    webpage.h \
    webserver.h \
    consts.h \
    utils.h \
    networkaccessmanager.h \
    cookiejar.h \
    filesystem.h \
    system.h \
    env.h \
    terminal.h \
    encoding.h \
    config.h \
    repl.h \
    replcompletable.h

SOURCES += phantom.cpp \
    callback.cpp \
    webpage.cpp \
    webserver.cpp \
    main.cpp \
    csconverter.cpp \
    utils.cpp \
    networkaccessmanager.cpp \
    cookiejar.cpp \
    filesystem.cpp \
    system.cpp \
    env.cpp \
    terminal.cpp \
    encoding.cpp \
    config.cpp \
    repl.cpp \
    replcompletable.cpp

OTHER_FILES += usage.txt \
    bootstrap.js \
    configurator.js \
    modules/fs.js \
    modules/webpage.js \
    modules/webserver.js \
    repl.js

include(gif/gif.pri)
include(mongoose/mongoose.pri)
include(linenoise/linenoise.pri)

linux* {
    INCLUDEPATH += breakpad/src

    SOURCES += breakpad/src/client/linux/crash_generation/crash_generation_client.cc \
      breakpad/src/client/linux/handler/exception_handler.cc \
      breakpad/src/client/linux/log/log.cc \
      breakpad/src/client/linux/minidump_writer/linux_dumper.cc \
      breakpad/src/client/linux/minidump_writer/linux_ptrace_dumper.cc \
      breakpad/src/client/linux/minidump_writer/minidump_writer.cc \
      breakpad/src/client/minidump_file_writer.cc \
      breakpad/src/common/convert_UTF.c \
      breakpad/src/common/md5.cc \
      breakpad/src/common/string_conversion.cc \
      breakpad/src/common/linux/file_id.cc \
      breakpad/src/common/linux/guid_creator.cc \
      breakpad/src/common/linux/memory_mapped_file.cc \
      breakpad/src/common/linux/safe_readlink.cc
}

win32: RC_FILE = phantomjs_win.rc
os2:   RC_FILE = phantomjs_os2.rc

mac {
    QMAKE_CXXFLAGS += -fvisibility=hidden
    QMAKE_LFLAGS += '-sectcreate __TEXT __info_plist Info.plist'
    CONFIG -= app_bundle
# Uncomment to build a Mac OS X Universal Binary (i.e. x86 + ppc)
#    CONFIG += x86 ppc
}
CONFIG(static) {
    DEFINES += STATIC_BUILD
}
