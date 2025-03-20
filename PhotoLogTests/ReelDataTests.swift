import XCTest
import SwiftData
@testable import PhotoLog

final class ReelDataTests: XCTestCase {
    
    var container: ModelContainer!
    var context: ModelContext!
    
    override func setUpWithError() throws {
        // Create an in-memory container for testing
        let schema = Schema([ReelData.self])
        let configuration = ModelConfiguration(inMemory: true)
        container = try ModelContainer(for: schema, configurations: [configuration])
        context = ModelContext(container)
    }
    
    override func tearDownWithError() throws {
        container = nil
        context = nil
    }
    
    func testCreateReelData() throws {
        // Create a ReelData instance
        let reelData = ReelData(name: "Test Reel", description: "Test Description")
        
        // Add it to the context
        context.insert(reelData)
        
        // Save changes
        try context.save()
        
        // Fetch the data
        let descriptor = FetchDescriptor<ReelData>(predicate: #Predicate { $0.name == "Test Reel" })
        let fetchedReels = try context.fetch(descriptor)
        
        // Assert
        XCTAssertEqual(fetchedReels.count, 1)
        XCTAssertEqual(fetchedReels.first?.name, "Test Reel")
        XCTAssertEqual(fetchedReels.first?.description, "Test Description")
    }
    
    func testUpdateReelData() throws {
        // Create and save a ReelData instance
        let reelData = ReelData(name: "Initial Name", description: "Initial Description")
        context.insert(reelData)
        try context.save()
        
        // Update the instance
        reelData.name = "Updated Name"
        reelData.description = "Updated Description"
        try context.save()
        
        // Fetch the updated data
        let descriptor = FetchDescriptor<ReelData>(predicate: #Predicate { $0.name == "Updated Name" })
        let fetchedReels = try context.fetch(descriptor)
        
        // Assert
        XCTAssertEqual(fetchedReels.count, 1)
        XCTAssertEqual(fetchedReels.first?.name, "Updated Name")
        XCTAssertEqual(fetchedReels.first?.description, "Updated Description")
    }
    
    func testDeleteReelData() throws {
        // Create and save a ReelData instance
        let reelData = ReelData(name: "To Delete", description: "Will be deleted")
        context.insert(reelData)
        try context.save()
        
        // Delete the instance
        context.delete(reelData)
        try context.save()
        
        // Attempt to fetch the deleted data
        let descriptor = FetchDescriptor<ReelData>()
        let fetchedReels = try context.fetch(descriptor)
        
        // Assert
        XCTAssertEqual(fetchedReels.count, 0)
    }
    
    func testFetchAllReelData() throws {
        // Create multiple instances
        let reel1 = ReelData(name: "Reel 1", description: "Description 1")
        let reel2 = ReelData(name: "Reel 2", description: "Description 2")
        let reel3 = ReelData(name: "Reel 3", description: "Description 3")
        
        // Insert all reels
        context.insert(reel1)
        context.insert(reel2)
        context.insert(reel3)
        try context.save()
        
        // Fetch all reels
        let descriptor = FetchDescriptor<ReelData>()
        let fetchedReels = try context.fetch(descriptor)
        
        // Assert
        XCTAssertEqual(fetchedReels.count, 3)
    }
}
