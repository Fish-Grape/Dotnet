#include "pch.h"
#include <iostream>
#include <regex>
using namespace std;

class RegexAndString {
string s;

string checkISBN() {
	const regex pattern("^[0-9]{1}(-){1}[0-9]{3}(-){1}[0-9]{5}(-){1}[0-9]$");
	const regex number("[0-9]{1}");
	bool b = regex_match(s, pattern);
	if (!b)
		return "Error format!";
	int a[10] = { 0 }, flag = 0, sum = 0;
	for (int i = 0; i < s.length(); i++)
	{
		string index(1, s[i]);
		if (regex_match(index, number))
		{
			for (int j = flag; j < 10; j++)
			{
				if (a[j] == 0)
				{
					a[j] = (int)(s[i] - '0');
					flag = j + 1;
					break;
				}
			}
		}
	}

	for (int j = 0; j < 9; j++)
	{
		sum += a[j] * (j + 1);
	}
	char lastNum = sum % 11 == 10 ? 'x' : sum % 11 + '0';
	if (lastNum == s[s.length() - 1])
		return "Right";
	else
	{
		string s2(1, lastNum);
		s.erase(s.size() - 1, s.size());
		s += s2;
		return s;
	}
}

public:void init()
{
	cin >> s;

	cout << checkISBN();
}
};
