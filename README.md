![ReviewKit Logo](https://github.com/FlineDev/ReviewKit/blob/main/Logo.png?raw=true)

# ReviewKit

Request reviews only from users with enough recent positive activity and only at appropriate times.

Read the [Introduction Article](https://www.fline.dev/introducing-reviewkit/?ref=github.com) to learn how to best use ReviewKit in your app.

## Requirements

* Minimum deployment target iOS 11+, macOS 10.14+
* Swift 5.8+ (Xcode 14.3+) 


## Usage

1. Add ReviewKit to your app using SwiftPM:
   
   ```
   https://github.com/FlineDev/ReviewKit.git
   ```

2. (Optional) Adjust the criteria by which app reviews are requested on app start (defaults to 3 positive events & expiration after 14 days):

   ```Swift
   import ReviewKit
   // ...
   ReviewKit.criteria = ReviewCriteria(minPositiveEventsWeight: 5, eventsExpireAfterDays: 30)
   ```

3. Determine common workflows in your app and when a user completes one of them, call this:

   ```Swift
   ReviewKit.recordPositiveEventAndRequestReviewIfCriteriaMet()
   ```

4. (Optional) Determine other activities that you think are positive experiences for your users. If they are in the middle of workflows, instead of the above call:

   ```Swift
   ReviewKit.recordPositiveEvent()  // optionally, you can pass a custom `weight` parameter, defaults to 1
   ```
   
5. (Optional) Set a delay between crossing the threshold and showing the review request.
   ```swift
   ReviewKit.reviewDelay = 5.0
   ```

That's it – you have configured App Review requests for your app!


### Notes

* ReviewKit is using Apple's `SKStoreReviewController` API internally. That API already encapsulates some logic to make sure not to ask users too often.
* That logic is turned off in `DEBUG` mode, so you might want to set `ReviewKit.enabledInDebugBuilds = false` once you've tested that everything works.
* There's also a function `requestReviewIfCriteriaMet()` that does not record a positive event in case you need that.


## Showcases

I extracted this library _from_ and use it directly _in_ the following apps (check them out to support me!):

* [RemafoX: Easy App Localization](https://remafox.app/)
* [Twoot it! – Schedule Posts](https://twoot-it.app/)
* [CrossCraft: Custom Crosswords](https://crosscraft.app/)


## License

This library is released under the MIT License. See LICENSE for details.
