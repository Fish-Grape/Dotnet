#include "pch.h"
#include <iostream>
using namespace std;
int num;
int *x;
int sum;

//校验落子是否合规
bool place(int k) {
	for (int j = 1; j < k; j++) 
		if (abs(x[k] - x[j]) == abs(k - j) || x[j] == x[k])
			return false;
	return true;
}

void backtrack(int t) {
	if (t > num) {
		sum++;
		for (int m = 1; m <= num; m++) {
			cout << "<" << m << "," << x[m] << ">";
		}
		cout << endl;
	}
	else
	{
		for (int i = 1; i <= num; i++) {
			x[t] = i;
			if (place(t))
				backtrack(t + 1);
		}
		
	}
}

//八皇后问题（回溯法）
void EightQueenCal_init() {
	num = 8;
	sum = 0;
	x = new int[num + 1];
	for (int i = 0; i <= num; i++)
		x[i]=0;
	backtrack(1);
	cout << "该方案共有:" << sum << endl;
	delete []x;
}