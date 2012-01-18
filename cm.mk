#
# Copyright (C) 2011 The Android Open-Source Project
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

$(call inherit-product, device/moto/droid2/full_droid2.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/gsm.mk)

PRODUCT_NAME := cm_droid2
PRODUCT_BRAND := moto
PRODUCT_DEVICE := droid2
PRODUCT_MODEL := MotoA953
PRODUCT_MANUFACTURER := moto
PRODUCT_SBF := 4.1-22
PRODUCT_SFX := MILS2_U6

# Release name and versioning
PRODUCT_RELEASE_NAME := Droid2

UTC_DATE := $(shell date +%s)
DATE     := $(shell date +%Y%m%d)

PRODUCT_BUILD_PROP_OVERRIDES := \
BUILD_ID=MILS2_U6_4.1-22 \
BUILD_DISPLAY_ID="MILS2_U6_4.1-22" \
PRODUCT_NAME=${PRODUCT_MODEL}_${PRODUCT_SFX} \
TARGET_DEVICE=droid2 \
BUILD_FINGERPRINT=moto/RTGB/umts_droid2:2.3.4/MILS2_U6_4.1-22/1317097892:user/release-keys \
PRODUCT_BRAND=MOTO \
PRIVATE_BUILD_DESC="umts_droid2-user 2.3.4 MILS2_U6_4.1-22 1317097892 release-keys" \
BUILD_NUMBER=${DATE} \
BUILD_VERSION_TAGS=release-keys \
TARGET_BUILD_TYPE=user \
USER=kxcr46


