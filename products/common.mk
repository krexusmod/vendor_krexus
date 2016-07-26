# Generic product
PRODUCT_NAME := krexus
PRODUCT_BRAND := krexus
PRODUCT_DEVICE := generic

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.config.alarm_alert=Oxygen.ogg \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false \
    ro.setupwizard.network_required=false \
    ro.setupwizard.gservices_delay=-1 \
    ro.adb.secure=1 \
    ro.krexus.version=krexus_mm-$(shell date +"%y%m%d")-$(TARGET_DEVICE) \
    ro.krexusmod.version=krexusmod_mm-$(shell date +"%y%m%d")-$(TARGET_DEVICE)

# Common overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/krexus/overlay/common

# Bootanimation (add if it exists)
ifneq ($(wildcard vendor/krexus/prebuilt/bootanimation/$(TARGET_DEVICE).zip),)
PRODUCT_COPY_FILES += \
        vendor/krexus/prebuilt/bootanimation/$(TARGET_DEVICE).zip:system/media/bootanimation.zip
endif

# Extra Packages
PRODUCT_PACKAGES += \
    Busybox \
    CellBroadcastReceiver \
    KrexusOTA \
    Launcher3 \
    LiveWallpapersPicker \
    masquerade \
    Stk \
    WallpaperPicker

# Latin IME lib (based on ARM architecture)
ifneq ($(filter arm,$(TARGET_ARCH)),)
PRODUCT_COPY_FILES += \
    vendor/krexus/prebuilt/common/lib/libjni_latinime.so:system/lib/libjni_latinime.so
else
PRODUCT_COPY_FILES += \
    vendor/krexus/prebuilt/common/lib64/libjni_latinime.so:system/lib64/libjni_latinime.so
endif

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Backuptool Support
PRODUCT_COPY_FILES += \
    vendor/krexus/prebuilt/common/addon.d/50-krexus.sh:system/addon.d/50-krexus.sh \
    vendor/krexus/prebuilt/common/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/krexus/prebuilt/common/bin/backuptool.functions:system/bin/backuptool.functions

# init.d script support
PRODUCT_COPY_FILES += \
    vendor/krexus/prebuilt/common/bin/sysinit:system/bin/sysinit \
    vendor/krexus/prebuilt/common/root/init.d.rc:root/init.d.rc \
    vendor/krexus/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner
