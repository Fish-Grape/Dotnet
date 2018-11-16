#include "pch.h"
#include "chtbl.h"

int hashpjw(const void *key)
{
	const char *ptr;
	unsigned int val;
	val = 0;
	ptr = (char *)key;

	while (*ptr!='\0')
	{
		unsigned int tmp;
		val = (val << 4) + (*ptr);

		if (tmp = (val & 0xf0000000))
		{
			val = val ^ (tmp >> 24);
			val = val ^ tmp;
		}
		ptr++;
	}
	return val % 2;
}
