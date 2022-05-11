import XCTest
@testable import SafeStringDictionary

final class SafeStringDictionaryTests: XCTestCase {

    func isDictionaryThreadSafe(dictionary: SafeStringDictionary, testKey: String) -> Bool {
        let numberOfIterations = 1000

        for i in 0..<numberOfIterations {
            let writeValue = "\(testKey): \(i)"
            dictionary.add(key: testKey, value: writeValue)
            let readValue = dictionary.get(key: testKey)

            if readValue != writeValue {
                return false
            }
        }
        return true
    }

    func testThat_Dictionary_CanStoreValue() async {
        let dict = SafeDictionary1()
        let result = isDictionaryThreadSafe(dictionary: dict, testKey: "key1")

        XCTAssertTrue(result)
    }

    func testThat_DictionaryIsThreadSafe() async {
        let dict = SafeDictionary1()

        let task1 = Task { () -> Bool in
            return isDictionaryThreadSafe(dictionary: dict, testKey: "key1")
        }

        let task2 = Task { () -> Bool in
            return isDictionaryThreadSafe(dictionary: dict, testKey: "key2")
        }


        let task1IsThreadSafe = await task1.value
        XCTAssertTrue(task1IsThreadSafe)
        let task2IsThreadSafe = await task2.value
        XCTAssertTrue(task2IsThreadSafe)
    }
}
