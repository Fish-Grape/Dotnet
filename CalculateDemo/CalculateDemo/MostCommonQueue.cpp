#include "pch.h"
#include <stdlib.h>
#include <iostream>
#include <cstring>
using namespace std;

const int N = 1002;
int c[N][N], b[N][N];
char s1[N], s2[N];
int len1, len2;

void LCSL() {
	int i, j;
	for (i = 1; i <= len1; i++) {
		for (j = 1; j <= len2; j++) {
			if (s1[i - 1] == s2[j - 1]) {
				c[i][j] = c[i - 1][j - 1] + 1;
				b[i][j] = 1;
			}
			else
			{
				if (c[i][j - 1] >= c[i - 1][j]) {
					c[i][j] = c[i][j - 1];
					b[i][j] = 2;
				}
				else
				{
					c[i][j] = c[i - 1][j];
					b[i][j] = 3;
				}
			}
		}
	}
}

void print(int i, int j) {
	if (i == 0 || j == 0) return;
	if (b[i][j] == 1) {
		print(i - 1, j - 1);
		cout << s1[i - 1];
	}
	else if (b[i][j] == 2)
	{
		print(i, j - 1);
	}
	else
	{
		print(i - 1, j);
	}
}

void MostCommonQueue_init() {
	int i, j;
	cout << "请输入字符串s1:" << endl;
	cin >> s1;
	cout << "请输入字符串s2:" << endl;
	cin >> s2;
	len1 = strlen(s1);
	len2 = strlen(s2);
	for (i = 0; i <= len1; i++) {
		c[i][0] = 0;
	}
	for (j = 0; j <= len2; j++) {
		c[0][j] = 0;
	}
	LCSL();
	cout << "s1和s2最公共长子序列的长度是：" << c[len1][len2] << endl;
	cout << "s1和s2最公共长子序列是：" << endl;
	print(len1, len2);
}