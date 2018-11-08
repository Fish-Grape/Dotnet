#include "pch.h"
#include <stdio.h>
#include <stdlib.h>
#include <iostream>
using namespace std;

class QuickSort
{
	int a[101], n;
	void quickSort(int left, int right) {
		int i, j, t, temp;
		if (left > right)
			return;

		temp = a[left];
		i = left;
		j = right;
		while (i!=j)
		{
			while (a[j] >= temp && i < j)
				j--;
			while (a[i] <= temp && i < j)
				i++;

			if (i < j) {
				t = a[i];
				a[i] = a[j];
				a[j] = t;
			}
		}

		a[left] = a[i];
		a[i] = temp;

		quickSort(left, i - 1);
		quickSort(i + 1, right);
	}

	//快速排序（分治法）
public: void init() {
	int i, j, t;
	//cin >> n;
	n = 10;

	for (i = 1; i <= n; i++)
		a[i] = rand() % 100;

	quickSort(1, n);

	for (i = 1; i <= n; i++)
		cout << a[i] << endl;
}
};

