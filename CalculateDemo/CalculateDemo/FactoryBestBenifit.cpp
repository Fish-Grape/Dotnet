#include "pch.h"
#include <iostream>
#include <math.h>
#include <iomanip>
#include <stdio.h>
using namespace std;

class FactoryBestBenifit {

	float kernel[100][100];
	char FJL[100] = {};
	char JL[100] = {};
	int n, m, i, j;

	void print() {
		cout << endl;
		cout << "-----------------单纯形表如下-------------------" << endl;
		cout << "  ";
		cout << setw(7) << "b ";
		for (i = 1; i <= n; i++)
			cout << setw(7) << "x" << FJL[i];
		cout << endl;
		cout << "c ";
		for (i = 0; i <= n; i++)
		{
			if (i >= 1)
				cout << "x" << JL[i];
			for (j = 0; j <= m; j++)
				cout << setw(7) << kernel[i][j] << " ";
			cout << endl;
		}
	}

	void DCXA() {
		float max1;
		float max2;
		int e = -1;
		int k = -1;
		float min;
		while (true)
		{
			max1 = 0;
			max2 = 0;
			min = 100000000;
			for (j = 1; j <= m; j++) {
				if (max1 < kernel[0][j])
				{
					max1 = kernel[0][j];
					e = j;
				}
			}
			if (max1 <= 0) {
				cout << endl;
				cout << "获得最优解:" << kernel[0][0] << endl;
				print();
				break;
			}
			for (i = 1; i <= n; i++) {
				if (max2 < kernel[i][e])
				{
					max2 = kernel[i][e];
				}
				float temp = kernel[i][0] / kernel[i][e];
				if (temp > 0 && temp < min)
				{
					min = temp;
					k = i;
				}
			}
			cout << "基列变量：" << "x" << FJL[e] << " ";
			cout << "基离变量：" << "x" << JL[k] << endl;
			if (max2 == 0) {
				cout << "解无界"<<endl;
				break;
			}
			char temp = FJL[e];
			FJL[e] = JL[k];
			JL[k] = temp;
			for (i = 0; i <= n; i++) {
				if (i != k)
				{
					for (j = 0; j <= m; j++) {
						if (j != e)
						{
							if (i == 0 && j == 0)
								kernel[i][j] = kernel[i][j] + kernel[i][e] * kernel[k][j] / kernel[k][e];
							else
								kernel[i][j] = kernel[i][j] - kernel[i][e] * kernel[k][j] / kernel[k][e];
						}
					}
				}
			}
			for (i = 0; i <= n; i++) {
				if (i != k)
					kernel[i][e] = -kernel[i][e] / kernel[k][e];
			}
			for (j = 0; j <= m; j++) {
				if (j != e)
					kernel[k][j] = kernel[k][j] / kernel[k][e];
			}
			kernel[k][e] = 1 / kernel[k][e];
			print();
		}
	}

	//工厂最大效益问题（线性规划法）
public: void  FactoryBestBenifit_init() {
	int i, j;
	cout << "输入非基本变量个数和非基本变量下标：" << endl;
	//cin >> m;
	m = 3;
	for (i = 1; i <= m; i++)
		//cin >> FJL[i];
		FJL[i] = 245;
	cout << "输入基本变量个数和基本变量下标：" << endl;
	//cin >> n;
	n = 4;
	for (i = 1; i <= n; i++)
		//cin >> JL[i];
		JL[i] = 1367;
	cout << "输入约束标准型初始化单纯形表参数：" << endl;
	//for (i = 0; i <= n; i++) {
	//	for (j = 0; j <= m; j++)
	//		cin >> kernel[i][j];
	//}
	kernel[0][0] = 0;
	kernel[0][1] = 2.5;
	kernel[0][2] = 2.8;
	kernel[0][3] = 76.25;
	kernel[1][0] = 0;
	kernel[1][1] = 1;
	kernel[1][2] = 0;
	kernel[1][3] = -5;
	kernel[2][0] = 0;
	kernel[2][1] = 0;
	kernel[2][2] = 1;
	kernel[2][3] = -2;
	kernel[3][0] = 12000;
	kernel[3][1] = 0;
	kernel[3][2] = 0;
	kernel[3][3] = 1;
	kernel[4][0] = 1000;
	kernel[4][1] = 0.1;
	kernel[4][2] = 0.08;
	kernel[4][3] = 0.05;
	print();
	DCXA();
}
};