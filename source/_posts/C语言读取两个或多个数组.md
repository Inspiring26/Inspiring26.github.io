---
title: C语言读取两个或多个数组
date: 2020-12-26 20:36:09
tags: [C, 记录]
---
### 代码
```
#include <stdio.h>
void main() {
	int a[20],b[20],num=0,i=0;
	while(1){
		if (num==0){
			scanf("%d",&a[i++]);
			if (a[i-1]==-1){
				i=0;
				num++;
			}
		}
		if (num==1){
			scanf("%d",&b[i++]);
			if (b[i-1]==-1){
				break;
			}
		}
	}
	printf("%d",a[0]);
	printf("%d",b[0]);
}
```
