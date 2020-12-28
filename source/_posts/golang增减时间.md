---
title: golang增减时间
date: 2020-12-28 15:53:49
tags: [golang, 记录]
---
```
package main

import (
	"fmt"
	"time"
)

func main() {
	start := time.Date(2009, 1, 1, 0, 0, 0, 0, time.UTC)
	oneDayLater := start.AddDate(0, 0, 1)
	oneMonthLater := start.AddDate(0, 1, 0)
	oneYearLater := start.AddDate(1, 0, 0)

}
```
AddDate里的参数可以为负。

