//: Playground - noun: a place where people can play

import UIKit

// 時間のかかる処理
func doSomething(number: Int) {
    print("Task \(number): Start")
    for i in 0 ... 10 {
        //sleep(1)
        print("Task \(number): Running ... \(i * 10)%")
    }
    print("Task \(number): Completed")
}

// すべて直列で処理
func inMainQueueOnly() {
    for i in 1 ... 3 {
        doSomething(number: i)
    }
    print("All tasks completed.")
}

//並列処理
func inConcurrentQueue() {
    for i in 1 ... 3 {
        DispatchQueue.global(qos: .default).async {
            doSomething(number: i)
        }
    }
    print("ここはキューの処理完了を待たずに実行される")
}

// 複数のキューを並列処理を待ってから、処理を行う
func doMoreAfterConcurretQueuesUsingDispatchGroup() {
    let group = DispatchGroup()

    for i in 1 ... 3 {
        group.enter()
        DispatchQueue.global(qos: .default).async {
            doSomething(number: i)
            group.leave()
        }
    }
    group.notify(queue: .global()) {
        print("すべてのキューの処理が完了しました")
    }

}

//実行
doMoreAfterConcurretQueuesUsingDispatchGroup()

////複数処理待ちの別バージョン。sleepのとこでなぜか処理が止まる。
//let group  = DispatchGroup()
//let queue1 = DispatchQueue(label: "com.GCD.groupQueue1")
//let queue2 = DispatchQueue(label: "com.GCD.groupQueue2")
//let queue3 = DispatchQueue(label: "com.GCD.groupQueue3")
//
//queue1.async(group: group) {
//    sleep(4)
//    print("excute queue1")
//}
//
//queue2.async(group: group) {
//    sleep(2)
//    print("excute queue2")
//}
//
//queue3.async(group: group) {
//    sleep(1)
//    print("excute queue3")
//}
//
//group.notify(queue: DispatchQueue.main) {
//    print("All task done")
//}

