//
//  Utils
//  Convenience functions for reuse
//

import Foundation

/// Wrapper around DispatchQueue.main.after
///
/// - Parameters:
///   - interval: Time, in seconds
///   - work: Block that will be executed after `interval` time
public func after(_ interval: TimeInterval, work: @escaping () -> Void) {
    let time: DispatchTime = DispatchTime.now() + .milliseconds(Int(interval * 1000.0))
    DispatchQueue.main.asyncAfter(deadline: time) {
        work()
    }
}
