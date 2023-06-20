import Foundation

struct PositiveEvent {
   let date: Date
   let weight: Int

   init(date: Date, weight: Int) {
      self.date = date
      self.weight = weight
   }
}

extension PositiveEvent: RawRepresentable {
   init?(rawValue: String) {
      let components = rawValue.components(separatedBy: "|->|")

      guard
         components.count == 2,
         let date = ISO8601DateFormatter().date(from: components[0]),
         let weight = Int(components[1])
      else { return nil }

      self.date = date
      self.weight = weight
   }

   var rawValue: String {
      [ISO8601DateFormatter().string(from: self.date), String(self.weight)].joined(separator: "|->|")
   }
}
