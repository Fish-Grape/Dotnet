#include "pch.h"
#include <cstring>
#include <stdlib.h>
#include <iostream>
using namespace std;

const int N = 100;

struct three {
	 double w;//重量
	 double v;//价值
	 double p;//性价比
	 three(){}
	 three(double _w, double _v, double _p)
	{
		w = _w;
		v = _v;
		p = _p;
	}
}threes[N];

bool cmp(three a, three b)
{
	return a.p > b.p;
}

void Alibaba_init()
{
	int n = 6;
	double m = 19;

	threes[0] = three(2, 8, (double)8 / 4);
	threes[1] = three(6, 1, (double)1 / 6);
	threes[2] = three(7, 9, (double)9 / 7);
	threes[3] = three(4, 3, (double)3 / 4);
	threes[4] = three(10, 2, (double)2 / 10);
	threes[5] = three(3, 4, (double)4 / 3);
	three min;
	
	for (int i = 0; i < 5; i++)
	{
		for (int j = 4; j >= i; j--)
		{
			if (cmp(threes[j + 1], threes[j]))
			{
				min = threes[j];
				threes[j] = threes[j + 1];
				threes[j + 1] = min;
			}
		}
	}

	double sum = 0.0;
	for (int i = 0; i < n; i++)
	{
		if (m > threes[i].w)
		{
			m -= threes[i].w;
			sum += threes[i].v;
		}
		else
		{
			sum += m * threes[i].p;
			break;
		}
	}
	cout << "装入最大宝物的价值(sum)：" << sum << endl;
}
