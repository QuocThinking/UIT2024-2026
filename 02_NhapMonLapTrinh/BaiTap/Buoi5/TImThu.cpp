#include <stdio.h>

int main() {
  int ngay, thang, nam;
  int thu;
  printf("Nhập Ngày : ");
  scanf("%d", &ngay);
  printf("Nhập tháng : ");
  scanf("%d", &thang);
  printf("Nhập năm : ");
  scanf("%d", &nam);
  thu = 0;
  for (int i = 1; i < nam; i ++){
    if(i % 4 == 0 && (i % 100 != 0 || i % 400 == 0)){
      thu += 2;
    }else {
      thu += 1;
    }
  }
}