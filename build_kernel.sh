#!/bin/bash

starttime=`date +'%Y-%m-%d %H:%M:%S'`

export ARCH=arm64
mkdir out

make -C $(pwd) -j24 O=$(pwd)/out DTC_EXT=$(pwd)/tools/dtc CONFIG_BUILD_ARM64_DT_OVERLAY=y CLANG_TRIPLE=aarch64-linux-gnu- vendor/f2q_usa_singlew_defconfig
make -C $(pwd) -j24 O=$(pwd)/out DTC_EXT=$(pwd)/tools/dtc CONFIG_BUILD_ARM64_DT_OVERLAY=y CLANG_TRIPLE=aarch64-linux-gnu-

endtime=`date +'%Y-%m-%d %H:%M:%S'`
start_seconds=$(date -d "$starttime" +%s)
end_seconds=$(date -d "$endtime" +%s)
echo 开始时间：$starttime
echo 结束时间：$endtime
echo 编译耗时：$((end_seconds-start_seconds))"s"
echo 产出内核位置：out/arch/arm64/boot/Image
