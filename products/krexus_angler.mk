# Inherit AOSP device configuration for angler
$(call inherit-product, device/huawei/angler/aosp_angler.mk)

# Inherit common product files.
$(call inherit-product, vendor/krexus/products/common.mk)

# Inherit maintainer information (if exists).
$(call inherit-product-if-exists, device/huawei/angler/krexus_maintainer.mk)

# Setup device specific product configuration.
PRODUCT_NAME := krexus_angler
PRODUCT_BRAND := google
PRODUCT_DEVICE := angler
PRODUCT_MODEL := Nexus 6P
PRODUCT_MANUFACTURER := Huawei

# Fingerprint
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=angler \
    BUILD_FINGERPRINT=google/angler/angler:6.0.1/MTC20F/3031278:user/release-keys \
    PRIVATE_BUILD_DESC="angler-user 6.0.1 MTC20F 3031278 release-keys"
