![ReviewKit Logo](https://github.com/FlineDev/ReviewKit/blob/main/Logo.png?raw=true)

[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FFlineDev%2FReviewKit%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/FlineDev/ReviewKit)

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

5. (Optional) Get more reviews from users who tried your app at least once, add this to your app entry point:

   ```Swift
   @AppStorage("appStarts")
   var appStarts: Int = 0
   ```

   And attach this modifier to your apps' root view:

   ```Swift
   .onAppear {
      self.appStarts += 1

      if self.appStarts >= 2 {
         ReviewKit.recordPositiveEventAndRequestReviewIfCriteriaMet()
      }
   }
   ```

That's it – you have configured App Review requests for your app!


### Notes

* ReviewKit is using Apple's `SKStoreReviewController` API internally. That API already encapsulates some logic to make sure not to ask users too often.
* That logic is turned off in `DEBUG` mode, so you might want to set `ReviewKit.enabledInDebugBuilds = false` once you've tested that everything works.
* There's also a function `requestReviewIfCriteriaMet()` that does not record a positive event in case you need that.


## Showcase

I extracted this library _from_ and use it _in_ these Indie apps (rate them with 5 stars to support me!):

<table>
  <tr>
    <th>App Icon</th>
    <th>App Name & Description</th>
    <th>Supported Platforms</th>
  </tr>
  <tr>
    <td>
      <a href="https://apps.apple.com/app/apple-store/id6476773066?pt=549314&ct=github.com&mt=8">
        <img src="https://raw.githubusercontent.com/FlineDev/HandySwift/main/Images/SCTranslator.webp" width="64" />
      </a>
    </td>
    <td>
      <a href="https://apps.apple.com/app/apple-store/id6476773066?pt=549314&ct=github.com&mt=8">
        <strong>TranslateKit: App Localizer</strong>
      </a>
      <br />
      Simple drag & drop translation of String Catalog files with support for 4 machine translation services.
    </td>
    <td>Mac</td>
  </tr>
  <tr>
    <td>
      <a href="https://apps.apple.com/app/apple-store/id6472669260?pt=549314&ct=github.com&mt=8">
        <img src="https://raw.githubusercontent.com/FlineDev/HandySwift/main/Images/CrossCraft.webp" width="64" />
      </a>
    </td>
    <td>
      <a href="https://apps.apple.com/app/apple-store/id6472669260?pt=549314&ct=github.com&mt=8">
        <strong>CrossCraft: Custom Crosswords</strong>
      </a>
      <br />
      Create themed & personalized crosswords. Solve them yourself or share them to challenge others.
    </td>
    <td>iPhone, iPad, Mac, Vision</td>
  </tr>
  <tr>
    <td>
      <a href="https://apps.apple.com/app/apple-store/id6477829138?pt=549314&ct=github.com&mt=8">
        <img src="https://raw.githubusercontent.com/FlineDev/HandySwift/main/Images/FocusBeats.webp" width="64" />
      </a>
    </td>
    <td>
      <a href="https://apps.apple.com/app/apple-store/id6477829138?pt=549314&ct=github.com&mt=8">
        <strong>FocusBeats: Pomodoro + Music</strong>
      </a>
      <br />
      Deep Focus with proven Pomodoro method & select Apple Music playlists & themes. Automatically pauses music during breaks.
    </td>
    <td>iPhone, iPad, Mac, Vision</td>
  </tr>
  <tr>
    <td>
      <a href="https://apps.apple.com/app/apple-store/id6479207869?pt=549314&ct=github.com&mt=8">
        <img src="https://raw.githubusercontent.com/FlineDev/HandySwift/main/Images/GuidedGuestMode.webp" width="64" />
      </a>
    </td>
    <td>
      <a href="https://apps.apple.com/app/apple-store/id6479207869?pt=549314&ct=github.com&mt=8">
        <strong>Guided Guest Mode</strong>
      </a>
      <br />
      Showcase Apple Vision Pro effortlessly to friends & family. Customizable, easy-to-use guides for everyone!
    </td>
    <td>Vision</td>
  </tr>
  <tr>
    <td>
      <a href="https://apps.apple.com/app/apple-store/id6478062053?pt=549314&ct=github.com&mt=8">
        <img src="https://raw.githubusercontent.com/FlineDev/HandySwift/main/Images/Posters.webp" width="64" />
      </a>
    </td>
    <td>
      <a href="https://apps.apple.com/app/apple-store/id6478062053?pt=549314&ct=github.com&mt=8">
        <strong>Posters: Discover Movies at Home</strong>
      </a>
      <br />
      Auto-updating & interactive posters for your home with trailers, showtimes, and links to streaming services.
    </td>
    <td>Vision</td>
  </tr>
</table>
