import XCTest
import SwiftData
@testable import PhotoLog

final class ReelDataTest: XCTestCase {
    var container: ModelContainer!
    var context: ModelContext!

    override func setUpWithError() throws {
        let schema = Schema([Reel.self])
        let configuration = ModelConfiguration(isStoredInMemoryOnly: true)

        container = try ModelContainer(for: schema, configurations: [configuration])
        context = ModelContext(container)
    }

    override func tearDownWithError() throws {
        container = nil
        context = nil
    }

    func testCreateReelData() throws {
        let filmStock: [FilmStock] = [
            FilmStock(id: "kodakEktachrome_35mm", brand: "Kodak", stockName: "Ektachrome", speed: 100, exposureCount: 36, type: "Slide/Colour Reversal", format: "35mm", assetId: "kodakEktachrome_35mm"),
            FilmStock(id: "kodakGold_24exp_35mm", brand: "Kodak", stockName: "Gold", speed: 200, exposureCount: 24, type: "C41 Colour", format: "35mm", assetId: "kodakGold_24exp_35mm"),
            FilmStock(id: "ilfordPanFPlus_35mm", brand: "Ilford", stockName: "PanF Plus", speed: 50, exposureCount: 36, type: "Black & White", format: "35mm", assetId: "ilfordPanFPlus_35mm"),
            FilmStock(id: "dubblefilmCinema800_35mm", brand: "dubblefilm", stockName: "CINEMA", speed: 800, exposureCount: 36, type: "C41 Colour", format: "35mm", assetId: "dubblefilmCinema800_35mm"),
            FilmStock(id: "fujifilmFujichromeVelvia50_120", brand: "FUJIFILM", stockName: "Fujichrome Velvia", speed: 50, exposureCount: 0, type: "Slide/Colour Reversal", format: "120", assetId: "fujifilmFujichromeVelvia50_120")
        ]

        let reelData: [Reel] = [
            Reel(reelName: "A001", reelNotes: "", reelNumber: 1, filmStock: filmStock[0], exposureCount: 12),
            Reel(reelName: "Untitled", reelNotes: "", reelNumber: 2, filmStock: filmStock[1], exposureCount: 22),
            Reel(reelName: "My Trip", reelNotes: "Photos taken on my trip", reelNumber: 3, filmStock: filmStock[2], exposureCount: 33),
            Reel(reelName: "Party", reelNotes: "Photos taken at my party", reelNumber: 4, filmStock: filmStock[3], exposureCount: 17),
            Reel(reelName: "Vacation 2025", reelNotes: "Photos taken on my vacation", reelNumber: 5, filmStock: filmStock[4], exposureCount: 6)
        ]

        for item in reelData {
            context.insert(item)
        }

        try context.save()

        let fetchDescriptor = FetchDescriptor<Reel>(sortBy: [SortDescriptor(\Reel.reelNumber)])
        let fetchedData = try context.fetch(fetchDescriptor)

        XCTAssertEqual(fetchedData.count, 5)
        XCTAssertEqual(fetchedData[0].reelNumber, 1)
        XCTAssertEqual(fetchedData[0].reelName, "A001")
        XCTAssertEqual(fetchedData[4].reelNumber, 5)
        XCTAssertEqual(fetchedData[4].reelName, "Vacation 2025")
        
    }
}
