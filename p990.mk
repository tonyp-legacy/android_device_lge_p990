# The gps config appropriate for this device
#$(call inherit-product, device/common/gps/gps_eu.mk)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/gps.conf:/system/etc/gps.conf

$(call inherit-product, device/lge/star-common/star.mk)

DEVICE_PACKAGE_OVERLAYS += device/lge/p990/overlay

# Inherit non-open-source blobs.
$(call inherit-product-if-exists, vendor/lge/p990/p990-vendor.mk)

# Board-specific init
PRODUCT_COPY_FILES += \
    device/lge/p990/init.p990.rc:root/init.star.rc \
    $(LOCAL_PATH)/ueventd.tegra.rc:root/ueventd.star.rc \
    $(LOCAL_PATH)/fstab.p990:root/fstab.p990

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/charger:root/charger \
    $(foreach f,$(wildcard $(LOCAL_PATH)/prebuilt/res/images/charger/*),$(f):root/res/images/charger/$(notdir $(f))) \
    $(foreach f,$(wildcard $(LOCAL_PATH)/prebuilt/res/images/security/*),$(f):root/res/images/security/$(notdir $(f)))

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/vold.fstab:system/etc/vold.fstab \
    $(LOCAL_PATH)/init.vsnet:system/bin/init.vsnet \
    $(LOCAL_PATH)/init.vsnet-down:system/bin/init.vsnet-down \
    $(LOCAL_PATH)/gps_brcm_conf.xml:system/etc/gps_brcm_conf.xml

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/check_sdcard.sh:system/bin/check_sdcard.sh \
    $(LOCAL_PATH)/lgdrm.img:system/bin/lgdrm.img

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel \
    $(LOCAL_PATH)/prebuilt/bthid.ko:system/lib/modules/bthid.ko \
    $(LOCAL_PATH)/prebuilt/scsi_wait_scan.ko:system/lib/modules/scsi_wait_scan.ko \
    $(LOCAL_PATH)/prebuilt/wireless.ko:system/lib/modules/wireless.ko \
    $(LOCAL_PATH)/prebuilt/zram.ko:system/lib/modules/zram.ko \
    $(LOCAL_PATH)/prebuilt/power.tegra.so:system/lib/hw/power.tegra.so 

PRODUCT_PACKAGES += \
    lgcpversion

PRODUCT_NAME := full_p990
PRODUCT_DEVICE := p990
PRODUCT_MODEL := LG-P990
