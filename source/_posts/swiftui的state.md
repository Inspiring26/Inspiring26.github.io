---
title: swiftui的state
date: 2021-05-27 11:13:11
tags: [swiftui, 总结]
---
### 主要用途
1.进行私有状态管理
2.驱动view的显示
当@state 声明的值发生变化时，它所在的struct下的body会重新求值，body里使用的其他View会重新创建。从而使body包含的内容被重新渲染了一遍。
```
import SwiftUI

struct DetailView:View {
    let number:Int
    var body: some View{
        Text("The Value: \(number)")
    }
}

struct AddOneView: View {
    @State private var value = 0
    var body: some View {
        VStack(alignment: .center) {
//            Text("The Value: \(value)")
            DetailView(number:value)
            Button("+1"){
                value += 1
            }
        }
    }
}

struct AddOneView_Previews: PreviewProvider {
    static var previews: some View {
        AddOneView()
    }
}
```

