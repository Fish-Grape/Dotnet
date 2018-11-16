#pragma once
#ifndef CHTBL_H
#define CHTBL_H
#include "pch.h"
#include "list.h"
#include <stdlib.h>

typedef struct CHTbL_
{
	int buckets;

	int(*h)(const void *key);
	int(*match)(const void *key1, const void *key2);
	void(*destory)(void *data);

	int size;
	List *table;
}CHTbL;

int chtbl_init(CHTbL *htbl, int buckets, int(*h)(const void *key),
	int(*match)(const void *key1, const void *key2), void(*destory)(void *data));

void chtbl_destory(CHTbL *htbl);

int chtbl_insert(CHTbL *htbl,const void *data);

int chtbl_remove(CHTbL *htbl, void **data);

int chtbl_lookup(const CHTbL *htbl, void **data);

#define chtbl_size(htbl) ((htbl)->size)

#endif // !CHTBL_H
