//
//  RobotBrain
//  Logic unit for Smarty the robot
//

import AVFoundation
import Foundation

public protocol RobotBrainDelegate: AnyObject {
    func robotShouldBlink()
    func robotShouldUnblink()
    func robotBrain(_ robotBrain: RobotBrain, sentiment: Sentiment, error: String?)
}

public class RobotBrain {

    public weak var delegate: RobotBrainDelegate?
    private var shouldBlink: Bool = true

    public func startBlink() {
        let time: TimeInterval = randomIntervalForBlink(willBlink: true)
        after(time) { [weak self] in
            guard self?.shouldBlink ?? false else { return }
            self?.delegate?.robotShouldBlink()
            self?.startUnblink()
        }
    }

    public func startUnblink() {
        let time: TimeInterval = randomIntervalForBlink(willBlink: false)
        after(time) { [weak self] in
            self?.delegate?.robotShouldUnblink()
            self?.startBlink()
        }
    }

    public func delayBlink(by time: TimeInterval) {
        shouldBlink = false
        after(time) { [weak self] in
            self?.shouldBlink = true
            self?.startBlink()
        }
    }

    public func say(_ string: String) {
        let speechUtterance: AVSpeechUtterance = AVSpeechUtterance(string: string)
        AVSpeechSynthesizer().speak(speechUtterance)
    }

    @available(iOS 11.0, *)
    public func analyze(_ text: String) {
        do {
            let classificationService: ClassificationService = try ClassificationService()
            let sentiment: Sentiment = classificationService.predictSentiment(from: text)
            delegate?.robotBrain(self, sentiment: sentiment, error: nil)
        } catch let error {
            delegate?.robotBrain(self, sentiment: Sentiment.negative, error: error.localizedDescription)
        }
    }
}

// MARK: - Random TimeInterval for blink

extension RobotBrain {
    private func randomIntervalForBlink(willBlink: Bool) -> TimeInterval {
        var lowerBound: TimeInterval = 0.05
        var upperBound: TimeInterval = 0.15
        if willBlink {
            lowerBound = 1
            upperBound = 4
        }

        let fixedPoint: TimeInterval = 1000
        let fixedLowerBound = Int(lowerBound * fixedPoint)
        let fixedUpperBound = Int(upperBound * fixedPoint)
        let delta = fixedUpperBound - fixedLowerBound
        let adjustment = Int(arc4random_uniform(UInt32(delta)))
        let result = lowerBound + TimeInterval(adjustment)/fixedPoint
        return result
    }
}
