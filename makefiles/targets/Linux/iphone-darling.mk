ifeq ($(_THEOS_TARGET_LOADED),)
_THEOS_TARGET_LOADED := 1
THEOS_TARGET_NAME := iphone

SDKTARGET ?= arm-apple-darwin9
SDKBINPATH ?= $(THEOS)/toolchain/XcodeDefault.xctoolchain/usr/bin
SYSROOT ?= $(THEOS)/sdk
ISYSROOT ?= $(SYSROOT)

PREFIX := dyld $(SDKBINPATH)/

TARGET_CC ?= $(PREFIX)clang
TARGET_CXX ?= $(PREFIX)clang++
TARGET_LD ?= $(PREFIX)clang++
TARGET_STRIP ?= $(PREFIX)strip
TARGET_STRIP_FLAGS ?= -x
TARGET_CODESIGN_ALLOCATE ?= $(PREFIX)codesign_allocate
TARGET_CODESIGN ?= ldid
TARGET_CODESIGN_FLAGS ?= -S

include $(THEOS_MAKE_PATH)/targets/_common/darwin.mk
include $(THEOS_MAKE_PATH)/targets/_common/darwin_flat_bundle.mk

TARGET_PRIVATE_FRAMEWORK_PATH = $(SYSROOT)/System/Library/PrivateFrameworks
TARGET_PRIVATE_FRAMEWORK_INCLUDE_PATH = $(ISYSROOT)/System/Library/PrivateFrameworks

SDKFLAGS := 
_THEOS_TARGET_CFLAGS := -isysroot $(ISYSROOT) $(SDKFLAGS) -I$(SYSROOT)/usr/include/c++/4.2.1
_THEOS_TARGET_LDFLAGS := -isysroot $(SYSROOT) $(SDKFLAGS) -multiply_defined suppress

TARGET_INSTALL_REMOTE := $(_THEOS_TRUE)
_THEOS_TARGET_DEFAULT_PACKAGE_FORMAT := deb
endif
