import Foundation

// Define the paths
let csvFilePath = "data/filmStocks.csv"
let jsonFilePath = "../PhotoLog/Data/filmStocks.json"

// Function to read CSV file
func readCSV(filePath: String) -> String? {
    do {
        var contents = try String(contentsOfFile: filePath, encoding: .utf8)
        contents = contents.replacingOccurrences(of: "\r", with: "")
        return contents
    } catch {
        print("Error reading CSV file: \(error)")
        return nil
    }
}

// Function to convert CSV to JSON
func convertCSVToJSON(csv: String) -> Data? {
    let rows = csv.components(separatedBy: "\n").filter { !$0.isEmpty }
    guard let header = rows.first?.components(separatedBy: ",") else { return nil }

    var jsonArray: [[String: Any]] = []

    for row in rows.dropFirst() {
        let values = row.components(separatedBy: ",")
        var jsonObject: [String: Any] = [:]

        for (index, value) in values.enumerated() {
            if header[index] == "speed" || header[index] == "exposureCount" {
                if let numValue: Int = Int(value) {
                    jsonObject[header[index]] = numValue
                } else if header[index] == "exposureCount" {
                    jsonObject[header[index]] = 0
                }
            } else {
                jsonObject[header[index]] = value
            }
        }

        jsonArray.append(jsonObject)
    }

    do {
        let jsonData = try JSONSerialization.data(withJSONObject: jsonArray, options: .prettyPrinted)
        return jsonData
    } catch {
        print("Error converting to JSON: \(error)")
        return nil
    }
}

// Function to write JSON data to file
func writeJSONToFile(jsonData: Data, filePath: String) {
    do {
        try jsonData.write(to: URL(fileURLWithPath: filePath))
        print("JSON data successfully written to \(filePath)")
    } catch {
        print("Error writing JSON data to file: \(error)")
    }
}

// Main execution
if let csvData = readCSV(filePath: csvFilePath) {
    if let jsonData = convertCSVToJSON(csv: csvData) {
        writeJSONToFile(jsonData: jsonData, filePath: jsonFilePath)
    }
}
