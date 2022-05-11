# Lesson-Swift-Concurrency

Let’s start with a class definition like this:

```swift
class SafeStringDictionary {
   public func add(key: String, value: String) { ... }
   public func delete(key: String) { ... }
   public func get(key: String) -> String
}
```

We’ll keep everything as String’s for now to keep the data part simple.  

Version 1: Implement the functions in that class in a thread-safe way using DispatchSemaphore() .
Version 2: Implement the functions in that class in a thread-safe way using DispatchQueue()

You can ensure thread-safety by creating an operation like this:

```swift
let opQ = OperationQueue()
opQ.maxConcurrentOperationCount = 10
```
