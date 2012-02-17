# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file is the build configuration for a full Android
# build for crespo hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#

# Get the long list of APNs
PRODUCT_COPY_FILES := device/sample/etc/apns-full-conf.xml:system/etc/apns-conf.xml

# Camera
PRODUCT_PACKAGES := \
    Camera

# Live Wallpapers
PRODUCT_PACKAGES += \
        Galaxy4 \
        HoloSpiralWallpaper \
        LiveWallpapers \
        LiveWallpapersPicker \
        MagicSmokeWallpapers \
        NoiseField \
        PhaseBeam \
        VisualizationWallpapers \
        librs_jni

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
# This is where we'd set a backup provider if we had one
#$(call inherit-product, device/sample/products/backup_overlay.mk)
$(call inherit-product, device/samsung/crespo/device.mk)

# Inherit common product files.
$(call inherit-product, vendor/aokp/products/common_phone.mk)

# Common overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/aokp/overlay/crespo

# Setup device specific product configuration.
PRODUCT_NAME := aokp_crespo
PRODUCT_BRAND := google
PRODUCT_DEVICE := crespo
PRODUCT_MODEL := Nexus S
PRODUCT_MANUFACTURER := samsung

PRODUCT_BUILD_PROP_OVERRIDES := PRODUCT_NAME=soju BUILD_ID=IML74K BUILD_FINGERPRINT=google/soju/crespo:4.0.3/IML74K/239410:user/release-keys PRIVATE_BUILD_DESC="soju-user 4.0.3 IML74K 239410 release-keys" BUILD_NUMBER=239410

# Inherit common build.prop overrides
-include vendor/aokp/products/common_versions.mk

# Copy crespo specific prebuilt files
PRODUCT_COPY_FILES +=  \
    vendor/aokp/prebuilt/crespo/app/Thinkfree.apk:system/app/Thinkfree.apk \
    vendor/aokp/prebuilt/hdpi/bootanimation.zip:system/media/bootanimation.zip

# Inherit Face lock security blobs
#-include vendor/aokp/products/common_facelock.mk

# Inherit drm blobs
#-include vendor/aokp/products/common_drm.mk
