//
//  MultiThreading.swift
//  TestProb
//
//  Created by Anupriya V on 04/04/23.
//

import Foundation
extension ViewController {
    func mainThread() {
        DispatchQueue.main.async {
            // Asyn code on Main/UI thread
        }
    }
    func backgroundThread() {
        DispatchQueue.global(qos: .background).async {
            // Run async on BG Thread. Ex: API Call
        }
    }
    func customSerialQueue() {
        let serialQueue = DispatchQueue(label: "com.system.serial")
        serialQueue.async {
            sleep(1)
            print("Serial 1")
        }
        serialQueue.async {
            sleep(2)
            print("serial 2")
        }
        serialQueue.async {
            print("Serial 3")
        }
    }
    func concurrentQueue() {
        let concurrentQueue = DispatchQueue.global()
        concurrentQueue.async {
            sleep(1)
            print("Concurrent 1")
        }
        concurrentQueue.async {
            sleep(1)
            print("Concurrent 2")
        }
        concurrentQueue.async {
            sleep(1)
            print("Concurrent 3")
        }
        concurrentQueue.async {
            print("Concurrent 4")
        }
    }
    func customPrivateQueue() {
        let serialQueue = DispatchQueue(label: "com..system.serial")
        let concurrent = DispatchQueue(label: "com.system.concurrent", attributes: .concurrent)
        let globalQueue = DispatchQueue.global()
        let mainQueue = DispatchQueue.main
        concurrent.async {
            sleep(1)
            print("Concurrent 1")
        }
        concurrent.async {
            sleep(1)
            print("Concurrent 2")
        }
        concurrent.async {
            sleep(1)
            print("Concurrent 3")
        }
        concurrent.async {
            print("Concurrent 4")
        }
    }
    func dispatchGroup() {
        let group = DispatchGroup()
        let concurrentQueue = DispatchQueue.global()
        
        group.enter()
        concurrentQueue.async {
            print("Long running task 1")
            group.leave()
        }
        
        group.enter()
        concurrentQueue.async {
            sleep(1)
            print("Long running task 2")
            group.leave()
        }
        
        group.enter()
        concurrentQueue.async {
            sleep(1)
            print("Long running task 3")
            group.leave()
        }
        
        //When all are finished
        group.notify(queue: concurrentQueue) {
            sleep(1)
            
            print("All tasks completed")
        }
        //        group.wait() // Blocks the maiin thread, have to be added in another dispatch.async
        //        print("Here")
        
    }
    func dispatchSemaphore() {
        var arr = [Int]()
        // An object that controlls access to resouorces acfross multiple execution contexts use Semaphores
        let semaphore = DispatchSemaphore(value: 3) // value is number of concurrent tasks
        
        let concurrentQueue = DispatchQueue.global()
        
        concurrentQueue.async {
            print("Long running task 1")
            arr.append(1)
            semaphore.signal()
        }
        semaphore.wait()

        concurrentQueue.async {
            print("Long running task 2")
            arr.append(2)
            semaphore.signal()
        }
        semaphore.wait()

        print(arr)
    }
    
    /// Dispatch dource is used for detecting changes to files/folders, signals, memory warnings and etc.
    func dispatchSource() {
        let filePath = URL(fileURLWithPath: "/Users/philips/Documents/VoiceAssistanceAppp/ProbSolv/TestProb/TestProb/log.txt")
        do {
            let fileHandle = try FileHandle(forReadingFrom: filePath)
            let source = DispatchSource.makeFileSystemObjectSource(fileDescriptor: fileHandle.fileDescriptor, eventMask: .write, queue: .main)
            source.setEventHandler {
                print("Event")
            }
            source.resume()
        } catch {
            print(error)
        }
        
    }
}
