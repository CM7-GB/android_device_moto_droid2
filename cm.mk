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
PRODUCT_MODEL := MotoA955
PRODUCT_MANUFACTURER := moto
PRODUCT_SBF := 4.1-22
PRODUCT_SFX := MILS2_U6

# Release name and versioning
PRODUCT_RELEASE_NAME := Droid2

UTC_DATE := $(shell date +%s)
DATE     := $(shell date +%Y%m%d)
