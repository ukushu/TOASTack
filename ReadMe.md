# TOASTack = Toast Stack

# How to use:
1) apply on your MainView:
```
MainView()
    .applyToaster()
```

2) Make your own design of ToastView or use ToastSample

3) Make your Toast:
```
Button(action: {
    Toaster.shared.make { id in
        ToastSample(delete: { Toaster.shared.delete(id: id) })
    }
}) {
    Text(verbatim: "Make toast for me!")
}
```
