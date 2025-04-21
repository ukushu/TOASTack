# TOASTack = Toast Stack

```
git@github.com:ukushu/TOASTack.git
https://github.com/ukushu/TOASTack.git
```

Works on:
* iOS >= .v16
* macOS >= .v13


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

## How to create more awesome custom designs?

`ToastSample2` from `ToastSample.swift` file shows you how to create:
* custom design
* animated icon
* do data insertion into toast
* dismiss by horizontal swipe in any direction

Lets implement random toast generator:
```
func createSomeToast() {
    let title = ["Hello", "Title", "You miss the call", "Banana", "I'm waiting for you", "Why so sad?"]
        .randomElement()!
    let sf = ["bell", "bell.and.waves.left.and.right.fill","music.note","exclamationmark.3","exclamationmark.shield"]
        .randomElement()!
    let color = [Color.black, Color.blue, Color.red, Color.brown].randomElement()!
    
    let toastData = ToastData1(title: title, descr: "Some descr text blablabla bla", sfSymbol: sf, color: color)
    
    Toaster.shared
        .make { id in
            // custom design of the toast
            ToastSample2(id: id)
                // Put data to display into the toast
                .environmentObject(toastData)
        }
}
```
result:



[1]: https://i.sstatic.net/wJLOGVY8.gif
[2]: https://i.sstatic.net/V0d4C4It.gif
