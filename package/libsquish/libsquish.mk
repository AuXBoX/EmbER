################################################################################
#
# libsquish
#
################################################################################

LIBSQUISH_VERSION = 1.10
LIBSQUISH_SOURCE = squish-$(LIBSQUISH_VERSION).tar.gz
LIBSQUISH_SITE = https://libsquish.googlecode.com/files
LIBSQUISH_INSTALL_STAGING = YES
LIBSQUISH_LICENSE = MIT
LIBSQUISH_LICENSE_FILES = README

define LIBSQUISH_INSTALL_STAGING_CMDS
	mkdir -p $(STAGING_DIR)/usr/lib/pkgconfig/
	CXX=$(TARGET_CXX) CXXFLAGS="$(TARGET_CXXFLAGS)" \
	$(MAKE) -C $(@D) install PREFIX=/usr INSTALL_DIR=$(STAGING_DIR)/usr
endef

define LIBSQUISH_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/include/
	mkdir -p $(TARGET_DIR)/usr/lib/pkgconfig/
	CXX=$(TARGET_CXX) CXXFLAGS="$(TARGET_CXXFLAGS)" \
	$(MAKE) -C $(@D) install PREFIX=/usr INSTALL_DIR=$(TARGET_DIR)/usr
endef

$(eval $(generic-package))
