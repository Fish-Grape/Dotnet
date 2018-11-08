#include "pch.h"
#include <stdlib.h>
#include <stdio.h>
#include <iostream>
using namespace std;

struct node
{
	int data;
	struct node *next;
};


void node_init() {
	struct node *head, *p, *q, *t;
	int i, n, a;
	cin >> n;
	head = NULL;
	q = NULL;
	for (i = 1; i <= n; i++) {
		cin >> a;
		p = (struct node *)malloc(sizeof(struct node));
		p->data = a;
		p->next = NULL;
		if (head == NULL) 
			head = p;
		else if(q!=NULL)
			q->next = p;
		q = p;
	}

	t = head;
	while (t!= NULL)
	{
		cout << t->data << endl;
		t = t->next;
	}
}