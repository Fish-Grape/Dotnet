#include "pch.h"
#include "list.h"
#include "chtbl.h"
#include <stdlib.h>
#include <string.h>

int chtbl_init(CHTbL *htbl, int buckets, int(*h)(const void *key),
	int(*match)(const void *key1, const void *key2), void(*destory)(void *data))
{
	int i;
	if ((htbl->table = (List *)malloc(buckets * sizeof(List))) == NULL)
		return -1;
	htbl->buckets = buckets;
	for (i = 0; i < htbl->buckets; i++)
		list_init(&htbl->table[i], destory);
	htbl->h = h;
	htbl->match = match;
	htbl->destory = destory;
	htbl->size = 0;

	return 0;
}

void chtbl_destory(CHTbL *htbl)
{
	int i;
	for (i = 0; i < htbl->buckets; i++)
	{
		list_destory(&htbl->table[i]);
	}
	free(htbl->table);
	memset(htbl, 0, sizeof(CHTbL));
	return;
}

int chtbl_insert(CHTbL *htbl, const void *data)
{
	void *temp;
	int bucket, retval;

	temp = (void *)data;
	if (chtbl_lookup(htbl, &temp) == 0)
		return 1;
	bucket = htbl->h(data) % htbl->buckets;
	if ((retval = list_ins_next(&htbl->table[bucket], NULL, data)) == 0)
		htbl->size++;
	return retval;
}

int chtbl_remove(CHTbL *htbl, void **data)
{
	ListElmt *element, *prev;
	int bucket;

	bucket=htbl->h(*data) % htbl->buckets;
	prev = NULL;

	for (element = list_head(&htbl->table[bucket]); element != NULL; element = list_next(element))
	{
		if (htbl->match(*data, list_data(element)))
		{
			if (list_rem_next(&htbl->table[bucket], prev, data) == 0)
			{
				htbl->size--;
				return 0;
			}
			else
			{
				return -1;
			}
		}
		prev = element;
	}
	return -1;
}

int chtbl_lookup(const CHTbL *htbl, void **data)
{
	ListElmt *element;
	int bucket;

	bucket = htbl->h(*data) % htbl->buckets;
	for (element = list_head(&htbl->table[bucket]); element != NULL; element = list_next(element))
	{
		if (htbl->match(*data, list_data(element)))
		{
			*data = list_data(element);
			return 0;
		}
	}
	return -1;
}