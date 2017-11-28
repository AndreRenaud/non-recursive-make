#include <stdio.h>
#include <string.h>
#include <zlib.h>

#include "lib2.h"

/** Example function that depends on an external library - zlib */
int lib2(char *buffer)
{
	z_stream s;;
	unsigned char output[50];
	printf("Running zlib\n");

	s.zalloc = Z_NULL;
	s.zfree = Z_NULL;
	s.opaque = Z_NULL;
	s.avail_in = strlen(buffer)+1;
	s.next_in = (unsigned char *)buffer;
	s.avail_out = sizeof(output);
	s.next_out = output;

	deflateInit(&s, Z_BEST_COMPRESSION);
	deflate(&s, Z_FINISH);
	deflateEnd(&s);
	printf("Compressed to %u\n", (unsigned)(sizeof(output) - s.avail_out));
	return 0;
}
