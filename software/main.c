#include <stdio.h>
#include <system.h>
#include <altera_avalon_pio_regs.h>
#include <unistd.h>

int main()
{
    printf("Helloa !\n");


    int i = 0;
    int sw;

    int last_key = 1;

    int paused = 0;

    while (1) {

        int key_now = IORD_ALTERA_AVALON_PIO_DATA(KEY_1_BASE);
        sw = IORD_ALTERA_AVALON_PIO_DATA(SW_4_BASE);


        if (last_key == 1 && key_now == 0) {

            if (paused == 0) {
                paused = 1;
            } else {
                paused = 0;
            }
        }

        last_key = key_now;


        if (paused == 0) {
            i++;
        }


        int j = i % 8;
        IOWR_ALTERA_AVALON_PIO_DATA(LED_8_BASE, 1 << j);


        usleep(sw * 100000);
    }

    return 0;
}
