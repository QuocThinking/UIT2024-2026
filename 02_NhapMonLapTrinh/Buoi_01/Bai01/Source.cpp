#include<iostream>
using namespace std;

int main() {
	int a, b, tong, hieu, tich;
	float thuong;
	cout << ("Nhap a:");
	cin >> a;
	cout << ("Nhap b : ");
	cin >> b;
	tong = a + b;
	hieu = a - b;
	tich = a * b;
	thuong = static_cast<float>(a) / b;
	cout << a << " + " << b << " = " << tong << endl;
	cout << a << " / " << b << " = " << thuong << endl;
	cin.get();
	return 0;
}