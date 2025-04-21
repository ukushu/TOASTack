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
```swift
MainView()
    .applyToaster()
```

2) Make your own design of ToastView or use `ToastSample1`, `ToastSample2`

3) Add toast to the stack of toasts:
```swift
Button(action: {
    Toaster.shared.make { id in
        ToastSample1(id: id)
    }
}) {
    Text(verbatim: "Make toast for me!")
}
```

And that’s it.

Seriously — nothing else needed.

This is result:

[![enter image description here][1]][1]

[![enter image description here][2]][2]



## But also there is also exist configs :)

```swift
Toaster.shared.config.animation = .easeInOut
Toaster.shared.config.dimOnToast = true
Toaster.shared.config.edge = .bottom
//... and other
```

## How to create more awesome custom designs?

Check out [ToastSample2.swift](https://github.com/ukushu/TOASTack/blob/main/Sources/TOAStack/Toast_Designs/Samples/ToastSample2.swift). It demonstrates how to:
* Populate your toast with dynamic data
* Create a custom design
* Add an animated icon
* Dismiss the toast with a horizontal swipe in either direction

Now, let’s implement a “random toast generator” using the `ToastSample2` view:

```swift
func makeSomeToast() {
    let title = ["Hello", "Title", "You miss the call", "Banana", "I'm waiting for you", "Why so sad?"]
        .randomElement()!
    let sf = ["bell", "bell.and.waves.left.and.right.fill","music.note","exclamationmark.3","exclamationmark.shield"]
        .randomElement()!
    let color = [Color.black, Color.blue, Color.red, Color.brown].randomElement()!
    
    let toastData = SampleToastData(title: title, descr: "Some descr text blablabla bla", sfSymbol: sf, color: color)
    
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

![IMG_8529](https://github.com/user-attachments/assets/682e0018-419b-4f1e-b76a-8c04c0ce81d4)

## How you can help this project?

1) Create your own custom toast design
2) Polish it for both iOS and macOS
3) Place your design in the "Toast_Designs" directory as a separate file
4) Submit a Pull Request — share your toast template with the community! :)


PS: If you need support of watchOS/ VisionOS - feel free to make Pull Request









[1]: https://i.sstatic.net/wJLOGVY8.gif
[2]: https://i.sstatic.net/V0d4C4It.gif
