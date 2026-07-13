#
# Copyright (C) 2020 The Android Open Source Project
# Copyright (C) 2020 The TWRP Open Source Project
# Copyright (C) 2020 SebaUbuntu's TWRP device tree generator
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_PATH := device/ireadygo/G2

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := generic

# Assert
TARGET_OTA_ASSERT_DEVICE := G2

# File systems
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 20971520       # 调整为 20 MiB，避免空间不足
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_COPY_OUT_VENDOR := vendor

# Kernel
BOARD_KERNEL_CMDLINE := 
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/zImage-dtb
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_KERNEL_IMAGE_NAME := zImage-dtb
TARGET_KERNEL_ARCH := arm
TARGET_KERNEL_HEADER_ARCH := arm
TARGET_KERNEL_SOURCE := kernel/ireadygo/G2
TARGET_KERNEL_CONFIG := G2_defconfig

# Platform
TARGET_BOARD_PLATFORM := mt6589

# Hack: prevent anti rollback
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 16.1.0

# TWRP Configuration
TW_THEME := portrait_hdpi
TW_EXTRA_LANGUAGES := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_USE_TOOLBOX := true

# ============ 新增 / 修改部分（解决编译问题并优化） ============

# 强制使用 xz 压缩 Recovery 镜像（减小体积）
BOARD_RAMDISK_COMPRESSOR := xz

# 显式禁用不需要的组件（减小体积）
TW_INCLUDE_BASH := false
TW_INCLUDE_NANO := false
TW_INCLUDE_PIGZ := false
TW_INCLUDE_OPENAES := false
TW_INCLUDE_TWRPAPP := false
TW_INCLUDE_CRYPTO := false
TW_INCLUDE_BUSYBOX := false
TW_INCLUDE_OPENSSH := false

# 设置默认语言和版本署名
TW_DEFAULT_LANGUAGE := zh_CN
TW_DEVICE_VERSION := Xxinn034

# 兼容性标志（绕过老版本 host 工具问题）
TARGET_USES_PREBUILT_KERNEL := true
BOARD_SEPOLICY_DIRS :=
BUILD_BROKEN_USES_BUILD_COPY_HEADERS := true
BUILD_BROKEN_DUP_RULES := true

# 完全禁用 SELinux 策略编译（设备不支持）
TW_NO_SELINUX := true
SELINUX_IGNORE_NEVERALLOWS := true

# 解决 host 工具（checkpolicy/libselinux）的链接错误
BUILD_BROKEN_WHOLE_STATIC_LIBRARIES := true
BUILD_BROKEN_PREBUILT_WHOLE_STATIC_LIBRARIES := true
BOARD_USES_SEPOLICY := false
