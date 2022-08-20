// goddamn we've gotten so far

#if os(watchOS)

import Foundation
import WatchKit

// this package is purely so that using watchtube integrations is simple for other devs.
// i know it isnt much lol
// ill be adding more functionality soon, atm its only opening videos but i plan for more.

@available(watchOS 8.0, *) // watchtube only supported on watchos 8
public struct WatchTube {
    /// Opens a YouTube video in WatchTube for you
    /// - Parameter id: ID of the video to open
    public static func openVideo(_ id: String) {
        let range = NSRange(location: 0, length: id.utf16.count)
        let regex = try! NSRegularExpression(pattern: videoIdRegex)
        guard regex.firstMatch(in: id, range: range) != nil else { alert("An invalid video ID was passed to WatchTubeKit"); return }
        
        openWatchTubeVideo(id: id)
    }
    
    internal static func alert(_ msg: String) {
        let vc = WKApplication.shared().visibleInterfaceController!
        vc.alert(msg)
    }
    
    internal static func openWatchTubeVideo(id: String) {
        let urlStr = "\(watchUrl)\(id)"
        let url = URL(string: urlStr)!
        WKExtension.shared().openSystemURL(url)
    }
    
    internal static let videoIdRegex = "[0-9A-Za-z_-]{10}[048AEIMQUYcgkosw]"
    
    internal static let watchUrl = "https://watchtube.app/watch/"
}

extension WKInterfaceController {
    internal func alert(_ msg: String) {
        presentAlert(withTitle: "WatchTubeKit", message: msg, preferredStyle: .alert, actions: [WKAlertAction(title: "Dismiss", style: .cancel, handler: {})])
    }
}

#endif
