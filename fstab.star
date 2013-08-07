# Android fstab file.
#<src>                 <mnt_point>         <type>    <mnt_flags and options>                                   <fs_mgr_flags>
# The filesystem that contains the filesystem checker binary (typically /system) cannot
# specify MF_CHECK, and must come before any filesystems that do specify MF_CHECK

# Init mount points
/dev/block/mmcblk0p12   /system             ext4      ro,noatime,nodiratime                                                                          wait
/dev/block/mmcblk0p2    /cache              ext4      noatime,nodiratime,nosuid,nodev,journal_async_commit,data=writeback,nodelalloc,errors=panic    wait
/dev/block/mmcblk0p7    /lgdrm              ext3      noatime,nodiratime,nosuid,nodev,journal_async_commit,errors=panic                              wait
/dev/block/mmcblk0p9    /data               ext4      noatime,nodiratime,nosuid,nodev,journal_async_commit,data=writeback,nodelalloc,errors=panic    wait

#internal sdcard
/devices/platform/sdhci-tegra.3/mmc_host/mmc0   /storage/sdcard0   auto   defaults   voldmanaged=sdcard0:11,nonremovable 
#external sdcard
/devices/platform/sdhci-tegra.2/mmc_host/mmc1   /storage/sdcard1   auto   defaults   voldmanaged=sdcard1:auto 
