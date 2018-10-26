#include "pch.h"
#include <iostream>
#include <algorithm>
#include <cstring>
#include <cmath>
#include <queue>
using namespace std;
const int N = 10;
bool bestx[N];
int w[N], v[N];
struct Node
{
	int cp;
	double up;
	int rw;
	int id;
	bool x[N];
	Node() { memset(x, 0, sizeof(x)); };
	Node(int _cp, double _up, int _rw,int _id) {
		cp = _cp;
		up = _up;
		rw = _rw;
		id = _id;
	}
};
struct Goods
{
	int weight;
	int value;
}goods[N];
struct Object
{
	int id;
	double d;
}S[N];

bool cmp(Object a1,Object a2) {
	return a1.d > a2.d;
}

bool operator <(const Node &a,const Node &b) {
	return a.up < b.up;
}

int bestp, W, n, sumw, sumv;

double Bound(Node tnode) {
	double maxvalue = tnode.cp;
	int t = tnode.id;
	double left = tnode.rw;
	while (t<=n&&w[t]<=left)
	{
		maxvalue += v[t];
		left -= w[t];
	}
	if (t <= n)
		maxvalue += 1.0*v[t] / w[t] * left;
	return maxvalue;
}

int priorbfs() {
	int t, tcp, tup, trw;
	priority_queue<Node> q;
	q.push(Node(0, sumv, W, 1));
	while (!q.empty())
	{
		Node livenode, lchild, rchild;
		livenode = q.top();
		q.pop();
		t = livenode.id;
		if (t > n || livenode.rw == 0) {
			if (livenode.cp >= bestp) {
				for (int i = 1; i <= n; i++) {
					bestx[i] = livenode.x[i];
				}
				bestp = livenode.cp;
			}
			continue;
		}
		if (livenode.up < bestp)
			continue;
		tcp = livenode.cp;
		trw = livenode.rw;
		if (trw >= w[t]) {
			lchild.cp = tcp + v[t];
			lchild.rw = trw - w[t];
			lchild.id = t + 1;
			tup = Bound(lchild);
			lchild = Node(lchild.cp, tup, lchild.rw, t + 1);
			for (int i = 1; i < t; i++) {
				lchild.x[i] = livenode.x[i];
			}
			lchild.x[t] = true;
			if (lchild.cp > bestp)
				bestp = lchild.cp;
			q.push(lchild);
		}
		rchild.cp = tcp;
		rchild.rw = trw;
		rchild.id = t + 1;
		tup = Bound(rchild);
		if (tup >= bestp)
		{
			rchild = Node(tcp, tup, trw, t + 1);
			for (int i = 0; i < t; i++) {
				rchild.x[i] = livenode.x[i];
			}
			rchild.x[t] = false;
			q.push(rchild);
		}
	}
	return bestp;
}


void SupermarketCal_init() {
	bestp = 0;
	sumw = 0;
	sumv = 0;
	cout << "请输入物品个数n:";
	cin >> n;
	cout << "请输入购物车容量w:";
	cin >> W;
	cout << "请依次输入每个物品的重量w和价值v，用空格分开:";
	for (int i = 1; i <= n; i++) {
		cin >> goods[i].weight >> goods[i].value;
		sumw += goods[i].weight;
		sumv += goods[i].value;
		S[i - 1].id = i;
		S[i - 1].d = 1.0*goods[i].value / goods[i].weight;
	}
	if (sumw <= W) {
		bestp = sumv;
		cout << "放入购物车的物品最大价值为：" << bestp << endl;
		cout << "所有的物品均放入购物车。";
		return;
	}
	sort(S, S + n, cmp);
	cout << "排序后的物品重量和价值:" << bestp << endl;
	for (int i = 1; i <= n; i++) {
		w[i] = goods[S[i - 1].id].weight;
		v[i] = goods[S[i - 1].id].value;
		cout << w[i] << "  " << v[i] << endl;
	}
	priorbfs();
	cout << "放入购物车物品最大价值为："<<bestp<<endl;
	cout << "放入购物车的物品序号为：";
	for (int i = 1; i <= n; i++) {
		if (bestx[i])
			cout << S[i - 1].id << " ";
	}
	return;
}
