# TOASTack = Toast Stack

```
git@github.com:ukushu/TOASTack.git
https://github.com/ukushu/TOASTack.git
```

Works on:
* iOS
* macOS


# How to use:
1) apply on your MainView:
```
MainView()
    .applyToaster()
```

2) Make your own design of ToastView or use ToastSample

3) Make some toast:
```
Button(action: {
    Toaster.shared.make { id in
        ToastSample(delete: { Toaster.shared.delete(id: id) })
    }
}) {
    Text(verbatim: "Make toast for me!")
}
```

And that’s it.

Seriously — nothing else needed.

As simple as it gets.


[![enter image description here][1]][1]
[![enter image description here][2]][2]


  



## But also there is also exist configs :)

```
Toaster.shared.config.animation = .easeInOut
Toaster.shared.config.dimOnToast = true
Toaster.shared.config.edge = .bottom
//... and other
```

* Also you can create your own toast design, just look how works ToastSample.



[1]: https://i.sstatic.net/wJLOGVY8.gif
[2]: https://i.sstatic.net/V0d4C4It.gif
