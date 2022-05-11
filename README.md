# Lesson-Swift-Concurrency

Create a class conforming to the protocol `SafeStringDictionary` (see `SafeDictionary1` as a starting point):

```
public protocol SafeStringDictionary {
   func add(key: String, value: String)
   func delete(key: String)
   func get(key: String) -> String?
}
```

We’ll keep everything as String’s for now to keep the data part simple.  

Step 1: Implement the functions without worrying about thread safety.

Step 2: Modify your implementation to use `DispatchSemaphore()` to ensure thread safety.

Step 3: Modify your implementation to use `DispatchQueue()` to ensure thread safety.

You can use the unit test `testThat_Dictionary_CanStoreValue()` to verify core functionality and `testThat_DictionaryIsThreadSafe()` to determine thread safety.
