import Foundation

/// The minimum criteria to be met to request a review from a user.
public struct ReviewCriteria {
   let minPositiveEventsWeight: Int
   let eventsExpireAfterDays: Int
   let minimumTimeBeforeRequest: DateComponents

   /// - Parameters:
   ///   - minPositiveEventsWeight: The minimum positive events weight that needs to be surpassed to request a review. With the default event weight, this equals the number of events.
   ///   - eventsExpireAfterDays: The relevant time interval to consider events within when looking into the past. Events outside this time period expire and get deleted from persistent storage.
    ///  - minimumTimeBeforeRequest: The minimum time period between the first active (un-expired) positive event and the current time to request the review. For example, setting this to 1 day will require that the first un-expired positive event be at least 1 day in the past before requesting the review. This can prevent a user who's trying out the app for the first time from receiving the review request. This is disabled by default. To manually disable it, set some component to 0, e.g. `DateComponents(day: 0)`.
   public init(minPositiveEventsWeight: Int, eventsExpireAfterDays: Int, minimumTimeBeforeRequest: DateComponents = DateComponents(day: 0)) {
      self.minPositiveEventsWeight = minPositiveEventsWeight
      self.eventsExpireAfterDays = eventsExpireAfterDays
      self.minimumTimeBeforeRequest = minimumTimeBeforeRequest
   }
}
