#!/vendor/bin/sh
#The following module will insert as the same time as bootanimation.

    insmod /vendor/lib/modules/mtk_msb9121.ko
    insmod /vendor/lib/modules/mtk_pcmcia.ko

    insmod /vendor/lib/modules/mtk-smi-tv.ko
    insmod /vendor/lib/modules/test_power.ko
