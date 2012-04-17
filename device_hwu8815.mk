$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/huawei/hwu8815/hwu8815-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/huawei/hwu8815/overlay

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/huawei/hwu8815/recovery_kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel\
    device/huawei/hwu8815/recovery/sbin/rmt_storage_recovery:/root/sbin/rmt_storage_recovery

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := generic_hwu8815
PRODUCT_DEVICE := hwu8815
PRODUCT_BRAND := huawei

pathmap_INCL := recovery:device/huawei/hwu8815/recovery


