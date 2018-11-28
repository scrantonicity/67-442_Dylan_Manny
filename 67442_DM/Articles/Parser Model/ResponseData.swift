import Foundation

struct ResponseData: Decodable {
  let events: [Event]
  let births: [Birth]
  let deaths: [Death]
  
  enum CodingKeys: String, CodingKey {
    case events = "Events"
    case births = "Births"
    case deaths = "Deaths"
  }
}

