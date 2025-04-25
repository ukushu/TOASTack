# TOASTack = Toast Stack
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fukushu%2FTOASTack%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/ukushu/TOASTack)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fukushu%2FTOASTack%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/ukushu/TOASTack)


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

![1](https://github.com/user-attachments/assets/cc50cab2-c00a-4e9a-ade0-115fdcd239db)

![2](https://github.com/user-attachments/assets/f759cb22-3b89-446a-8e40-2ec3a64a1cd8)




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

# Current Toast design templates:

## CapsuleToast:
<img width="340" alt="image" src="https://github.com/user-attachments/assets/660f98ac-ed21-4acb-9cb8-22eba688fee7" />

* iOS/macOS polished
* Title
* Optional description (displayed in one line only)
* Optional SF Symbol
* Close button in right corner



# How you can help this project?

1) Create your own custom toast design
2) Polish it for both iOS and macOS
3) Place your design in the "Toast_Designs" directory as a separate file
4) Submit a Pull Request — share your toast template with the community! :)


PS: If you need support of watchOS/ VisionOS - feel free to make Pull Request with edit of "Package.swift" after testing on real device.


