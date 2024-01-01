import Foundation
import StoreKit

/// A helper to request a user review on the App Store at an appropriate time. Persists positive events in standard `UserDefaults`.
public enum ReviewKit {
   /// The minimum criteria to be met to request a review from a user.
   public static var criteria: ReviewCriteria = ReviewCriteria(minPositiveEventsWeight: 3, eventsExpireAfterDays: 14)

   /// Turns off the review request inside an `#if DEBUG`. On by default (for testing purposes).
   public static var enabledInDebugBuilds: Bool = true

   /// Records a positive event and requests a review if the criteria are met. Use when a user has completed a workflow and is less likely to be annoyed.
   /// - Parameter weight: The weight of the positive event. Defaults to 1.
   public static func recordPositiveEventAndRequestReviewIfCriteriaMet(weight: Int = 1) {
      self.recordPositiveEvent(weight: weight)
      self.requestReviewIfCriteriaMet()
   }

   /// Records a positive event without requesting a review. Use when the user is in the middle of a workflow to track the event without annoying the user.
   /// - Parameter weight: The weight of the positive event. Defaults to 1.
   public static func recordPositiveEvent(weight: Int = 1) {
      self.positiveEvents.append(PositiveEvent(date: Date(), weight: weight))
      self.positiveEvents.removeAll { $0.date < Date().addingTimeInterval(.days(-self.criteria.eventsExpireAfterDays)) }

      UserDefaults.standard.set(self.positiveEvents.map(\.rawValue), forKey: "ReviewKit.positiveEvents")
   }

   /// Requests a review if the criteria are met. Use when a user has completed a workflow and is less likely to be annoyed.
   /// - Parameter weight: The weight of the positive event. Defaults to 1.
   public static func requestReviewIfCriteriaMet(weight: Int = 1) {
      #if DEBUG
      guard self.enabledInDebugBuilds else { return }
      #endif

      let totalPositiveEventsWeight = self.positiveEvents.reduce(into: 0, { $0 += $1.weight })
      if totalPositiveEventsWeight >= self.criteria.minPositiveEventsWeight {
         #if os(iOS)
         if
            #available(iOS 14.0, *),
            let windowScene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene
         {
            SKStoreReviewController.requestReview(in: windowScene)
         } else {
            SKStoreReviewController.requestReview()
         }
         #else
         SKStoreReviewController.requestReview()
         #endif
      }
   }

   static var positiveEvents: [PositiveEvent] = UserDefaults.standard
      .array(forKey: "ReviewKit.positiveEvents")?
      .compactMap { $0 as? String }
      .compactMap { PositiveEvent(rawValue: $0) }
      ?? []
}

extension TimeInterval {
  static func days(_ value: Int) -> TimeInterval { Double(value) * 24 * 60 * 60 }
}
