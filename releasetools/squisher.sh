# This script is included in squisher
# It is the final build step (after OTA package)

DEVICE_OUT=$ANDROID_BUILD_TOP/out/target/product/milestone2
DEVICE_TOP=$ANDROID_BUILD_TOP/device/motorola/milestone2
VENDOR_TOP=$ANDROID_BUILD_TOP/vendor/motorola/milestone2


# Delete unwanted apps
rm -f $REPACK/ota/system/app/RomManager.apk

# rm -f $REPACK/ota/system/xbin/irssi

# these scripts are not required
rm -f $REPACK/ota/system/etc/init.d/03firstboot
rm -f $REPACK/ota/system/etc/init.d/04modules

# add an empty script to prevent logcat errors (moto init.rc)
touch $REPACK/ota/system/bin/mount_ext3.sh
chmod +x $REPACK/ota/system/bin/mount_ext3.sh

mkdir -p $REPACK/ota/system/etc/terminfo/x
cp $REPACK/ota/system/etc/terminfo/l/linux $REPACK/ota/system/etc/terminfo/x/xterm

# prebuilt boot, devtree, logo & updater-script
rm -f $REPACK/ota/boot.img
cp -f $ANDROID_BUILD_TOP/device/motorola/milestone2/updater-script $REPACK/ota/META-INF/com/google/android/updater-script
if [ -n "$CYANOGEN_RELEASE" ]; then
  cat $ANDROID_BUILD_TOP/device/motorola/milestone2/updater-script-rel >> $REPACK/ota/META-INF/com/google/android/updater-script
  cp -f $ANDROID_BUILD_TOP/vendor/motorola/milestone2/boot.smg $REPACK/ota/boot.img
  cp -f $ANDROID_BUILD_TOP/vendor/motorola/milestone2/devtree.smg $REPACK/ota/devtree.img
  cp -f $ANDROID_BUILD_TOP/vendor/motorola/milestone2/logo-moto.raw $REPACK/ota/logo.img
fi
cp -f $ANDROID_BUILD_TOP/out/target/product/milestone2/root/init $REPACK/ota/system/bootmenu/2nd-init/init
cp -f $REPACK/ota/system/bootmenu/binary/2nd-init $REPACK/ota/system/bootmenu/binary/2nd-init
cp -f $ANDROID_BUILD_TOP/out/target/product/milestone2/root/init.rc $REPACK/ota/system/bootmenu/2nd-init/init.rc
cp -f $ANDROID_BUILD_TOP/out/target/product/milestone2/root/sbin/adbd $REPACK/ota/system/bin/adbd

# use the static busybox as bootmenu shell
cp -f $ANDROID_BUILD_TOP/out/target/product/milestone2/utilities/busybox $REPACK/ota/system/bootmenu/binary/busybox

# ril fix
cp -f $REPACK/ota/system/lib/hw/audio.a2dp.default.so $REPACK/ota/system/lib/liba2dp.so

# temporary tool to fix orientation
cp -f $ANDROID_BUILD_TOP/device/motorola/milestone2/prebuilt/app/Orientator.apk $REPACK/ota/system/app/

