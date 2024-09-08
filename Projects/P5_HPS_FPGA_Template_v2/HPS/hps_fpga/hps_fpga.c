#include <stdio.h>
#include <stdint.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/mman.h>
#include "hps_0.h"

#define REG_BASE_LW_H2F    0xff200000u
#define REG_SPAN_LW_H2F    0x00200000u
#define HW_REGS_MASK        (REG_SPAN_LW_H2F - 1)

int main(void)
{
    int retVal = 0;
    int fd = 0;
    void *virtual_base = NULL;
    void *led_addr = NULL;

    if((fd = open("/dev/mem", (O_RDWR | O_SYNC))) == -1)
    {
        printf("ERROR: Could not open \"/dev/mem\"...\r\n");
        retVal = 1;
    }
    else
    {
        virtual_base = mmap(NULL, REG_SPAN_LW_H2F, (PROT_READ | PROT_WRITE), MAP_SHARED, fd, REG_BASE_LW_H2F);

        if(virtual_base == MAP_FAILED)
        {
            printf("ERROR: mmap() failed...\r\n");
            close(fd);
            return 1;
        }
        else
        {
            led_addr = virtual_base + ((unsigned long)(REG_BASE_LW_H2F + PIO_LEDS_BASE) & (unsigned long)(HW_REGS_MASK));
            // Loop to blink the LED every second
            while (1) 
            {
                *(uint32_t*)led_addr = 0x3ff; // Turn on the LEDs
                sleep(1);                      // Wait for 1 second
                *(uint32_t*)led_addr = 0x000;  // Turn off the LEDs
                sleep(1);                      // Wait for 1 second
            }

            if(munmap(virtual_base, REG_SPAN_LW_H2F) != 0)
            {
                printf("ERROR: munmap() failed...\r\n");
                retVal = 1;
            }
            close(fd);
        }
    }
    return retVal;
}