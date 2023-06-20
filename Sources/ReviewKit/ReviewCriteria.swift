import Foundation

/// The minimum criteria to be met to request a review from a user.
public struct ReviewCriteria {
   let minPositiveEventsWeight: Int
   let eventsExpireAfterDays: Int

   /// - Parameters:
   ///   - minPositiveEventsWeight: The minimum positive events weight that needs to be surpassed to request a review. With the default event weight, this equals the number of events.
   ///   - eventsExpireAfterDays: The relevant time interval to consider events within when looking into the past. Events outside this time period expire and get deleted from persistent storage.
   public init(minPositiveEventsWeight: Int, eventsExpireAfterDays: Int) {
      self.minPositiveEventsWeight = minPositiveEventsWeight
      self.eventsExpireAfterDays = eventsExpireAfterDays
   }
}
