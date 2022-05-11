
public protocol SafeStringDictionary {
   func add(key: String, value: String)
   func delete(key: String)
   func get(key: String) -> String?
}
