# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_eu_supl.mk)

DEVICE_PACKAGE_OVERLAYS += device/orange/Boston/overlay

# HAL libs and other system binaries
PRODUCT_PACKAGES += \
    hwprops \
    abtfilt \
    gps.Boston \
    lights.Boston \
    copybit.Boston \
    gralloc.Boston \
    libOmxCore \
    com.android.future.usb.accessory

# Extra apps
PRODUCT_PACKAGES += \
	Torch

ifeq ($(TARGET_PREBUILT_KERNEL),)
    LOCAL_KERNEL := device/orange/Boston/kernel
else
    LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# Live wallpaper packages
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    MagicSmokeWallpapers \
    VisualizationWallpapers \
    librs_jni

# Publish that we support the live wallpaper feature.
PRODUCT_COPY_FILES += \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml

# Board-specific init
PRODUCT_COPY_FILES += \
    device/orange/Boston/ueventd.qct.rc:root/ueventd.qct.rc \
    device/orange/Boston/init.qcom.rc:root/init.qcom.rc

## RIL related stuff
PRODUCT_COPY_FILES += \
    device/orange/Boston/spn-conf.xml:system/etc/spn-conf.xml \
    vendor/orange/Boston/proprietary/bin/qmuxd:system/bin/qmuxd \
    vendor/orange/Boston/proprietary/lib/liboncrpc.so:system/lib/liboncrpc.so \
    vendor/orange/Boston/proprietary/lib/libmmgsdilib.so:system/lib/libmmgsdilib.so \
    vendor/orange/Boston/proprietary/lib/libgsdi_exp.so:system/lib/libgsdi_exp.so \
    vendor/orange/Boston/proprietary/lib/libgstk_exp.so:system/lib/libgstk_exp.so \
    vendor/orange/Boston/proprietary/lib/libwms.so:system/lib/libwms.so \
    vendor/orange/Boston/proprietary/lib/libnv.so:system/lib/libnv.so \
    vendor/orange/Boston/proprietary/lib/libwmsts.so:system/lib/libwmsts.so \
    vendor/orange/Boston/proprietary/lib/libdss.so:system/lib/libdss.so \
    vendor/orange/Boston/proprietary/lib/libqmi.so:system/lib/libqmi.so \
    vendor/orange/Boston/proprietary/lib/libdiag.so:system/lib/libdiag.so \
    vendor/orange/Boston/proprietary/lib/libpbmlib.so:system/lib/libpbmlib.so \
    vendor/orange/Boston/proprietary/lib/libauth.so:system/lib/libauth.so \
    vendor/orange/Boston/proprietary/lib/liboem_rapi.so:system/lib/liboem_rapi.so \
    vendor/orange/Boston/proprietary/lib/libdsm.so:system/lib/libdsm.so \
    vendor/orange/Boston/proprietary/lib/libqueue.so:system/lib/libqueue.so \
    vendor/orange/Boston/proprietary/lib/libcm.so:system/lib/libcm.so \
    vendor/orange/Boston/proprietary/lib/libdll.so:system/lib/libdll.so \
    vendor/orange/Boston/proprietary/lib/libril-qc-1.so:system/lib/libril-qc-1.so \
    vendor/orange/Boston/proprietary/lib/libril-qcril-hook-oem.so:system/lib/libril-qcril-hook-oem.so    

## OMX proprietaries
PRODUCT_COPY_FILES += \
    vendor/orange/Boston/proprietary/lib/libmm-adspsvc.so:system/lib/libmm-adspsvc.so \
    vendor/orange/Boston/proprietary/lib/libOmxAacDec.so:system/lib/libOmxAacDec.so \
    vendor/orange/Boston/proprietary/lib/libOmxAmrRtpDec.so:system/lib/libOmxAmrRtpDec.so \
    vendor/orange/Boston/proprietary/lib/libOmxH264Dec.so:system/lib/libOmxH264Dec.so \
    vendor/orange/Boston/proprietary/lib/libOmxQcelpDec.so:system/lib/libOmxQcelpDec.so \
    vendor/orange/Boston/proprietary/lib/libOmxAacEnc.so:system/lib/libOmxAacEnc.so \
    vendor/orange/Boston/proprietary/lib/libOmxAmrwbDec.so:system/lib/libOmxAmrwbDec.so \
    vendor/orange/Boston/proprietary/lib/libOmxMp3Dec.so:system/lib/libOmxMp3Dec.so \
    vendor/orange/Boston/proprietary/lib/libOmxVidEnc.so:system/lib/libOmxVidEnc.so \
    vendor/orange/Boston/proprietary/lib/libOmxAmrDec.so:system/lib/libOmxAmrDec.so \
    vendor/orange/Boston/proprietary/lib/libOmxEvrcDec.so:system/lib/libOmxEvrcDec.so \
    vendor/orange/Boston/proprietary/lib/libOmxMpeg4Dec.so:system/lib/libOmxMpeg4Dec.so \
    vendor/orange/Boston/proprietary/lib/libOmxWmaDec.so:system/lib/libOmxWmaDec.so \
    vendor/orange/Boston/proprietary/lib/libOmxAmrEnc.so:system/lib/libOmxAmrEnc.so \
    vendor/orange/Boston/proprietary/lib/libOmxEvrcEnc.so:system/lib/libOmxEvrcEnc.so \
    vendor/orange/Boston/proprietary/lib/libOmxQcelp13Enc.so:system/lib/libOmxQcelp13Enc.so \
    vendor/orange/Boston/proprietary/lib/libOmxWmvDec.so:system/lib/libOmxWmvDec.so

## Hardware properties 
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml

## Camera proprietaries
PRODUCT_COPY_FILES += \
    vendor/orange/Boston/proprietary/lib/liboemcamera.so:system/lib/liboemcamera.so \
    vendor/orange/Boston/proprietary/lib/libmmjpeg.so:system/lib/libmmjpeg.so \
    vendor/orange/Boston/proprietary/lib/libmmipl.so:system/lib/libmmipl.so

## Atheros AR6002 firmware
PRODUCT_COPY_FILES += \
    device/orange/Boston/prebuilt/data.patch.hw2_0.bin:system/etc/firmware/data.patch.hw2_0.bin \
    device/orange/Boston/prebuilt/eeprom.bin:system/etc/firmware/eeprom.bin \
    device/orange/Boston/prebuilt/athwlan.bin.z77:system/etc/firmware/athwlan.bin.z77 \
    device/orange/Boston/prebuilt/calData_ar6102_15dBm.bin:system/etc/firmware/calData_ar6102_15dBm.bin \
    device/orange/Boston/hostapd.conf:system/etc/wifi/hostapd.conf \
    vendor/orange/Boston/proprietary/bin/hostapd:system/bin/hostapd

## Other libraries and proprietary binaries
PRODUCT_COPY_FILES += \
    vendor/orange/Boston/proprietary/bin/hci_qcomm_init:system/bin/hci_qcomm_init \
    device/orange/Boston/prebuilt/init.qcom.bt.sh:system/bin/init.qcom.bt.sh \
    vendor/orange/Boston/proprietary/lib/libms3c_yamaha.so:system/lib/libms3c_yamaha.so \
    vendor/orange/Boston/proprietary/lib/libsensor_yamaha.so:system/lib/libsensor_yamaha.so \
    device/orange/Boston/ms3c_charger_offset.cfg:system/etc/ms3c_charger.cfg \
    device/orange/Boston/ms3c_transformation.cfg:system/etc/ms3c_transform.cfg \
    vendor/orange/Boston/proprietary/bin/updateSensorNV:system/bin/updateSensorNV \
    vendor/orange/Boston/proprietary/bin/sensorserver_yamaha:system/bin/sensorserver_yamaha \
    device/orange/Boston/prebuilt/sensordaemon:system/bin/sensordaemon \
    vendor/orange/Boston/proprietary/lib/hw/sensors.qcom.so:system/lib/hw/sensors.qcom.so \
    vendor/orange/Boston/proprietary/bin/gsensorcalibration:system/bin/gsensorcalibration \
    device/orange/Boston/prebuilt/SensorCalibration.apk:system/app/SensorCalibration.apk \
    device/orange/Boston/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt \
    device/orange/Boston/AudioFilter.csv:system/etc/AudioFilter.csv \
    vendor/orange/Boston/proprietary/lib/liba2dp.so:system/lib/liba2dp.so \
    vendor/orange/Boston/proprietary/lib/libaudioeq.so:system/lib/libaudioeq.so \
    vendor/orange/Boston/proprietary/lib/egl/egl.cfg:system/lib/egl/egl.cfg \
    vendor/orange/Boston/proprietary/lib/egl/libGLESv1_CM_adreno200.so:system/lib/egl/libGLESv1_CM_adreno200.so \
    vendor/orange/Boston/proprietary/lib/egl/libq3dtools_adreno200.so:system/lib/egl/libq3dtools_adreno200.so \
    vendor/orange/Boston/proprietary/lib/egl/libEGL_adreno200.so:system/lib/egl/libEGL_adreno200.so \
    vendor/orange/Boston/proprietary/lib/egl/libGLESv2_adreno200.so:system/lib/egl/libGLESv2_adreno200.so \
    vendor/orange/Boston/proprietary/etc/firmware/yamato_pfp.fw:system/etc/firmware/yamato_pfp.fw \
    vendor/orange/Boston/proprietary/etc/firmware/yamato_pm4.fw:system/etc/firmware/yamato_pm4.fw \
    vendor/orange/Boston/proprietary/lib/libgsl.so:system/lib/libgsl.so

PRODUCT_COPY_FILES += \
    device/orange/Boston/media_profiles.xml:system/etc/media_profiles.xml \
    device/orange/Boston/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
    device/orange/Boston/vold.fstab:system/etc/vold.fstab \
    device/orange/Boston/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/orange/Boston/7x27_kybd.kl:system/usr/keylayout/7x27_kybd.kl

$(call inherit-product, build/target/product/full_base.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := Boston
PRODUCT_DEVICE := Boston
PRODUCT_MODEL := Orange Boston

#Mejoras de consumo de rild y wifi
PRODUCT_PROPERTY_OVERRIDES = ro.wifi.channels=11
PRODUCT_PROPERTY_OVERRIDES += \
    rild.libpath=/system/lib/libril-qc-1.so \
    rild.libargs=-d /dev/smd0 \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=45 \
    keyguard.no_require_sim=true \
    ro.ril.hsxpa=2 \
    ro.ril.hsupa.category=5 \
    ro.ril.def.agps.mode=2 \
    ro.ril.gprsclass=10 \
    ro.com.google.locationfeatures=1 \
    ro.setupwizard.enable_bypass=1 \
    ro.media.dec.jpeg.memcap=20000000 \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.dexopt-flags=m=y \
    ro.compcache.default=0 \
    ro.com.android.dateformat=dd-MM-yyyy \
    ro.telephony.default_network=0
