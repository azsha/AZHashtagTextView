# AZHashTextView
<img src="image/sample.png" width="160"/>
- When you touch a hashtag in TextView, an event has occurred.

## Requirements
- Swift 3
- Xcode 8

## Integration
- Just drag AZHashTextView.swift to the project tree

## Usage
```swift
var myTextView: AZHashtagTextView!

```

- Input viewDidload().

```swift
myTextView.delegate = self
myTextView.resolveHashTags()


```

- Add TextView Delegate.
```swift
class ViewController: UIViewController, UITextViewDelegate {...}
```

- Add TextView Touch Delegate.
```swift
func textView(_ textView: UITextView, shouldInteractWith url: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {

if let aztextView = textView as? AZHashtagTextView {
if let URL = url.scheme {
    // Touch Event
}
    return false
}
```

- Please refer to the example.
