#ifndef __CONFIG_H_
#define __CONFIG_H_

#define POT_MTD			"/dev/mtdblock5"
#define POT_FILENAME		"/tmp/pot_value"




#define POT_MAX_VALUE	4320		/* 4320 minutes */
#define POT_RESOLUTION	1		/* minute */
#define POT_PORT	3333		/* potval listen this port */

#define NAND_FLASH_BLOCKSIZE	(128 * 1024)	/* bytes, 128KB */
#define NAND_FLASH_PAGESIZE	(2 * 1024)	/* bytes, 2KB */
#define FIRST_NTP_TIME_OFFSET	(FIRST_WIFISTATION_MAC_OFFSET + 16)
#define FIRST_WIFISTATION_MAC_OFFSET	(4 + NAND_FLASH_PAGESIZE)


#define SECTOR_FLAG "POTTOP"
#define POT_UPPER_BYTE_VALUE (NTP_RECORD_OFFSET - SECTOR_FLAG_LEN)

#endif
