import Foundation

struct Response: Decodable {
  let date:String
  let data:ResponseData
  let url: String
}
