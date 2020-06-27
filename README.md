# Progress Indicator

![Image](https://github.com/karthironald/ProgressIndicator/blob/master/Demo/Banner.gif)

We don't have a native progress view in the initial release of SwiftUI which supports iOS 13. We need to write our custom logic to add loading or progress view indicators in the app. Here you can find the collection of simple progress view indicators.


### Arc:
![Image](https://github.com/karthironald/ProgressIndicator/blob/master/Demo/Arc.gif)

```
Arc(progress: progress)
```

### Bar:
![Image](https://github.com/karthironald/ProgressIndicator/blob/master/Demo/Bar.gif)

```
Bar(progress: progress)
```

### Circular:
![Image](https://github.com/karthironald/ProgressIndicator/blob/master/Demo/Circular.gif)

```
Circular(progress: progress)
```

### Filled Circle:
![Image](https://github.com/karthironald/ProgressIndicator/blob/master/Demo/FilledCircle.gif)

```
FilledCircle(radius: 100, progress: progress)
```

Note: You can apply any modifiers as like a normal view

For example, it shows a circular progress view with 200 * 200 size, 

```
Circular(progress: progress)
    .frame(width: 200, height: 200, alignment: .center)
```

Thanks 👨🏻‍💻
