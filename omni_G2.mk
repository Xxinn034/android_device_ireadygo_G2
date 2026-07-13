# 继承 Omni 通用配置
$(call inherit-product, device/ireadygo/G2/device.mk)
$(call inherit-product, vendor/omni/config/common.mk)

# 产品基本信息
PRODUCT_NAME := omni_G2
PRODUCT_DEVICE := G2
PRODUCT_BRAND := ireadygo
PRODUCT_MANUFACTURER := ireadygo
PRODUCT_MODEL := G2

# 系统属性
PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_DISPLAY_ID=CM-10.1 \
    ro.product.name=omni_G2 \
    ro.product.device=G2