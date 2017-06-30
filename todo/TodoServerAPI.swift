
import Foundation



public class TodoServerAPI {
    
    static let baseURL = "http://localhost:8080/"
    
    
    public static func todoItemCreate(data: Data? = nil, completionHandler: @escaping (_ returnedData: Data?, _ response: URLResponse?, _ error: Error?) -> Void)  throws {
        
        var request = URLRequest(url: URL(string: baseURL+"api/todoModels")!)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = data
        let urlSession = URLSession(configuration: .default, delegate: nil, delegateQueue: nil)
        urlSession.dataTask(with: request) { (data, response, error) in
            
            let httpResponse = response as? HTTPURLResponse
          
            guard httpResponse != nil else {
                completionHandler(nil, nil, error)
                return
            }
            print(" httpResponse \(httpResponse)")
            }.resume()
    }
    
    public static func todoItems(completionHandler: @escaping (_ returnedData: Data?, _ response: URLResponse?, _ error: Error?) -> Void)  throws {
        
        var request = URLRequest(url: URL(string: baseURL+"api/todoModels")!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let urlSession = URLSession(configuration: .default, delegate: nil, delegateQueue: nil)
        urlSession.dataTask(with: request) { (data, response, error) in
            
            let httpResponse = response as? HTTPURLResponse
            
            guard httpResponse != nil else {
                completionHandler(nil, nil, error)
                return
            }
            
            if httpResponse?.statusCode == 200 {
                completionHandler(data, response, error)
            }
            }.resume()
    
    
   }
}
