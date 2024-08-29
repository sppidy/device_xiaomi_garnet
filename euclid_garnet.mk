#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
# Inherit some common Euclid stuff.
$(call inherit-product, vendor/euclid/config/common_full_phone.mk)
# Inherit from garnet device
$(call inherit-product, device/xiaomi/garnet/device.mk)
# Inherit from the MiuiCamera setup
$(call inherit-product-if-exists, vendor/xiaomi/garnet-miuicamera/products/miuicamera.mk)
# Sign the build if exists
$(call inherit-product-if-exists, vendor/keys/keys.mk)

TARGET_DISABLE_EPPE := true
PRODUCT_NAME := euclid_garnet
PRODUCT_DEVICE := garnet
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_BRAND := Redmi
PRODUCT_MODEL := 2312DRA50G
PRODUCT_SYSTEM_NAME := garnet_global
PRODUCT_SYSTEM_DEVICE := garnet
EUCLID_BUILD_TYPE := UNOFFICIAL
EUCLID_MAINTAINER := sppidy
EUCLID_GAPPS := true
TARGET_SUPPORTS_GOOGLE_RECORDER := true
TARGET_INCLUDE_STOCK_ARCORE := true
TARGET_INCLUDE_LIVE_WALLPAPERS := true
TARGET_INCLUDE_PIXEL_LAUNCHER := true
EXTRA_UDFPS_ANIMATIONS := true
TARGET_SUPPORTS_TOUCHGESTURES := true
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="garnet_global-user 14 UKQ1.231003.002 V816.0.9.0.UNRMIXM release-keys" \
    TARGET_DEVICE=$(PRODUCT_SYSTEM_DEVICE) \
    TARGET_PRODUCT=$(PRODUCT_SYSTEM_NAME)

BUILD_FINGERPRINT := Redmi/garnet_global/garnet:14/UKQ1.231003.002/V816.0.9.0.UNRMIXM:user/release-keys

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi
