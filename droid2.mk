#
# Copyright (C) 2011 The Android Open Source Project
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

#
# This is the product configuration for Motorola Droid2 (A955)
#

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

## (1) First, the most specific values, i.e. the aspects that are specific to GSM
PRODUCT_COPY_FILES += \
    device/moto/droid2/init_maps/init.rc:root/init.rc \
    device/moto/droid2/init_maps/init.mapphone_cdma.rc:root/init.mapphone_cdma.rc \
    device/moto/droid2/init_maps/init.mapphone_umts.rc:root/init.mapphone_umts.rc \
    device/moto/droid2/init_maps/init.mapphone_cdma.usb.rc:root/init.mapphone_cdma.usb.rc \
    device/moto/droid2/init_maps/ueventd.mapphone_cdma.rc:root/ueventd.mapphone_cdma.rc

## (2) Also get non-open-source files if available
$(call inherit-product-if-exists, vendor/moto/droid2/droid2-vendor.mk)

## (3)  Finally, the least specific parts, i.e. the non-GSM-specific aspects
PRODUCT_PROPERTY_OVERRIDES += \
	ro.media.capture.maxres=5m \
	ro.media.capture.fast.fps=4 \
	ro.media.capture.slow.fps=60 \
	ro.media.capture.flash=led \
	ro.media.capture.classification=classE \
	ro.media.capture.useDFR=1 \
	ro.media.capture.torchIntensity=45 \
	ro.media.camera.focal=3564.0,3564.0 \
	ro.media.camera.principal=1632.0,1224.0 \
	ro.media.camera.skew=0.0 \
	ro.media.camera.distortion=0.0,0.0,0.0,0.0,0.0 \
	ro.media.camera.calresolution=3264,2448 \
	ro.com.google.locationfeatures=1 \
	ro.telephony.call_ring.multiple=false \
	ro.telephony.call_ring.delay=3000 \
	ro.url.safetylegal=http://www.moto.com/staticfiles/Support/legal/?model=A955 \
	ro.media.dec.jpeg.memcap=20000000 \
	ro.media.dec.aud.wma.enabled=1 \
	ro.media.dec.vid.wmv.enabled=1 \
	dalvik.vm.lockprof.threshold=500 \
	ro.kernel.android.checkjni=0 \
	dalvik.vm.dexopt-data-only=1 \
	ro.vold.umsdirtyratio=20

# Droid2 fingerprint
PRODUCT_BUILD_PROP_OVERRIDES := BUILD_ID=VZW \
        BUILD_DISPLAY_ID=GRH78C \
        PRODUCT_NAME=droid2_vzw \
        TARGET_DEVICE=cdma_droid2 \
        BUILD_FINGERPRINT=verizon/droid2_vzw/cdma_droid2:2.3.3/STAB/110317:user/release-keys \
        PRODUCT_BRAND=verizon \
        PRIVATE_BUILD_DESC="cdma_droid2-user 2.3.3 STAB 110317 release-keys" \
        BUILD_NUMBER=2.3.20 \
        BUILD_UTC_DATE=1284778494 \
        TARGET_BUILD_TYPE=user \
        BUILD_VERSION_TAGS=release-keys \
        USER=dbretzm1

DEVICE_PACKAGE_OVERLAYS += device/moto/droid2/overlay

PRODUCT_COPY_FILES += \
	frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
	frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
	frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/base/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/base/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \

# ICS sound
PRODUCT_PACKAGES += \
	hcitool hciattach hcidump \
	libaudioutils audio.a2dp.default audio_policy.droid2 \
	libaudiohw_legacy 
        #audio.primary.omap3

# ICS graphics
PRODUCT_PACKAGES += libGLESv2 libEGL libGLESv1_CM

# TO FIX for ICS
PRODUCT_PACKAGES += gralloc.default hwcomposer.default

# ICS Camera
PRODUCT_PACKAGES += Camera camera.droid2 libcamera libui

#ICS Camera (temp disabled to fix build)
#PRODUCT_PACKAGES += overlay.omap3

#Common packages (gingerbread/ics)
PRODUCT_PACKAGES += \
	librs_jni \
	tiwlan.ini \
	dspexec \
	libbridge \
	wlan_cu \
	libtiOsLib \
	wlan_loader \
	libCustomWifi \
	wpa_supplicant.conf \
	dhcpcd.conf \
	libOMX.TI.AAC.encode \
	libOMX.TI.AAC.decode \
	libOMX.TI.AMR.decode \
	libOMX.TI.AMR.encode \
	libOMX.TI.WBAMR.encode \
	libOMX.TI.MP3.decode \
	libOMX.TI.WBAMR.decode \
	libOMX.TI.WMA.decode \
	libOMX.TI.Video.Decoder \
	libOMX.TI.Video.encoder \
	libOMX.TI.VPP \
	libVendor_ti_omx \
	libLCML \
	libOMX_Core \
	sensors.droid2 \
	lights.droid2 \
	libfnc \
	iwmulticall \
	hostap \
	hostapd.conf \
	libhostapdcli \
	bootmenu \
	utility_lsof \
	static_busybox \
	hijack_boot_2nd-init \
	Usb \
	ssh \
	Superuser \
	su \
	M2Parts \
	CMSettings

PRODUCT_PACKAGES += \
	qwerty.kcm

# for jpeg hw encoder/decoder
PRODUCT_PACKAGES += libskiahw libOMX.TI.JPEG.Encoder libOMX.TI.JPEG.decoder


PRODUCT_PACKAGES += e2fsck

# Add DroidSSHd (dropbear) Management App - tpruvot/android_external_droidsshd @ github
PRODUCT_PACKAGES += DroidSSHd dropbear dropbearkey sftp-server scp ssh


# CM9 apps
PRODUCT_PACKAGES += AndroidTerm
PRODUCT_PACKAGES += Trebuchet FileManager Torch
PRODUCT_PACKAGES += DSPManager libcyanogen-dsp


# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_COPY_FILES += \
	device/moto/droid2/vold.fstab:system/etc/vold.fstab

# copy all vendor (moto) kernel modules to system/lib/modules
PRODUCT_COPY_FILES += $(shell test -d vendor/moto/droid2/lib/modules &&  \
	find vendor/moto/droid2/lib/modules -name '*.ko' \
	-printf '%p:system/lib/modules/%f ')

# copy all others kernel modules under the "modules" directory to system/lib/modules
PRODUCT_COPY_FILES += $(shell test -d device/moto/droid2/modules && \
	find device/moto/droid2/modules -name '*.ko' \
	-printf '%p:system/lib/modules/%f ')

# Prebuilt boot.img
LOCAL_KERNEL := device/moto/droid2/kernel
PRODUCT_COPY_FILES += \
	$(LOCAL_KERNEL):kernel

# Blobs
$(call inherit-product, device/moto/droid2/droid2-blobs.mk)

# Live wallpaper packages
PRODUCT_PACKAGES += \
        LiveWallpapers \
        LiveWallpapersPicker \
        MagicSmokeWallpapers \
        VisualizationWallpapers

# Publish that we support the live wallpaper feature.
PRODUCT_COPY_FILES += \
        packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml


# ICS USB Packages
PRODUCT_PACKAGES += com.android.future.usb.accessory

PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \


$(call inherit-product, build/target/product/full_base.mk)

# Should be after the full_base include, which loads languages_full
PRODUCT_LOCALES += hdpi

PRODUCT_NAME := full_droid2
PRODUCT_DEVICE := A953
    
