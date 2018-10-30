#include "pch.h"
#include <cstring>
#include <stdlib.h>
#include <iostream>
using namespace std;

const int INF = 0x3fffffff;
const int N = 100;
bool s[N];
int closest[N];
int lowcost[N];

void Prim(int n, int u0, int c[N])
{
	s[u0] = true;
	int i;
	int j;
	for (i = 1; i <= n; i++)
	{
		if (i != u0)
		{
			lowcost[i] = c[u0, i];
			closest[i] = u0;
			s[i] = false;
		}
		else
			lowcost[i] = 0;
	}
	for (i = 1; i <= n; i++)
	{
		int temp = INF;
		int t = u0;
		for (j = 1; j <= n; j++)
		{
			if ((!s[j]) && (lowcost[j] < temp))
			{
				t = j;
				temp = lowcost[j];
			}
		}
		if (t == u0)
			break;
		s[t] = true;
		for (j = 1; j <= n; j++)
		{
			if ((!s[j]) && (c[t, j] < lowcost[j]))
			{
				lowcost[j] = c[t, j];
				closest[j] = t;
			}
		}
	}
}

void MinimumTree_init()
{
	int n, m, u, v, w, u0;
	int c[N];
	cout << "请输入节点数n和边m:";
	cin >> n;
	cin >> m;
	int sumcost = 0;
	for (int i = 1; i <= n; i++)
		for (int j = 1; j <= n; j++)
			c[i, j] = INF;
	cout << "请输入节点数u,v和边值w";
	c[1, 2] = c[2, 1] = 23;
	c[1, 6] = c[6, 1] = 28;
	c[1, 7] = c[7, 1] = 36;
	c[2, 3] = c[3, 2] = 20;
	c[2, 7] = c[7, 2] = 1;
	c[3, 4] = c[4, 3] = 15;
	c[3, 7] = c[7, 3] = 4;
	c[4, 5] = c[5, 4] = 3;
	c[4, 7] = c[7, 4] = 9;
	c[5, 6] = c[6, 5] = 17;
	c[5, 7] = c[7, 5] = 16;
	c[6, 7] = c[7, 6] = 25;
	cout << "请输入任一节点u0";
	u0 = 1;
	Prim(n, u0, c);
	cout << "数组lowcost内容为：";
	for (int i = 1; i <= n; i++)
		cout << lowcost[i] + " " << endl;
	for (int i = 1; i <= n; i++)
		sumcost += lowcost[i];
	cout << "最小花费是：" << sumcost << endl;
}