# WatchTubeKit

Simple package to allow developers to use WatchTube for their apps!

This package lets you hand users off to WatchTube for them to enjoy the WatchTube featureset when looking to watch content from YouTube in your app!

# Installing
We recommend using the Swift Package Manager and entering `https://github.com/WatchTubeTeam/WatchTubeKit`

# Usage
Begin by importing the module into the file you want to hand the user off to WatchTube from.
You'll be interested in using the `openWatchTubeVideo(id: String)` function.

In SwiftUI
```swift
var body: some View {
  Button("Open Video!") {
    let id = "0FH9cgRhQ-k"
    WatchTube.openVideo(id)
  }
}
```

You may also use this in WatchKit and it will work the same way.

# Upcoming
We're planning to add more features for external applications to do with WatchTube, like presenting a playlist or channel. That will have to come later though!
