//
//  LiveViewController
//  Controller for Smarty the robot
//

import PlaygroundSupport
import UIKit

public final class LiveViewController: UIViewController {

    enum LoadingState {
        case state1
        case state2
    }

    private let robotView: RobotView = RobotView()
    private let robotBrain: RobotBrain = RobotBrain()
    private var loadingTimer: Timer?
    private var loadingState: LoadingState = .state1

    // MARK: - Life cycle

    public override func loadView() {
        self.view = robotView
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        robotBrain.delegate = self
        robotBrain.startBlink()
    }

    // MARK: - Initial state

    public func setIntroductionInitialState() {
        robotView.setImage(UIImage(named: "Idle"))
        robotView.setLabel("Hello human! My name is Smarty! What is your name?")
    }

    public func setImprovmentInitialState() {
        robotView.setImage(UIImage(named: "Idle"))
        robotView.setLabel("Squawk!")
    }

    public func setSentimentInitialState() {
        robotView.setImage(UIImage(named: "Idle"))
        robotView.setLabel("Tell me something, so I can analyze it!")
    }

    public func setAcknowledgementInitialState() {
        robotView.setImage(UIImage(named: "Idle"))
        robotView.setLabel("Thank you for stopping by!")
    }

    // MARK: - Loading State

    private func startLoading() {
        robotBrain.delegate = nil
        loadingTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(changeLoadingState), userInfo: nil, repeats: true)
    }

    private func stopLoading() {
        loadingTimer?.invalidate()
        robotView.setImage(UIImage(named: "Idle"))
        robotBrain.delegate = self
    }

    @objc private func changeLoadingState() {
        switch loadingState {
        case .state1:
            robotView.setImage(UIImage(named: "Loading2"))
            loadingState = .state2
        case .state2:
            robotView.setImage(UIImage(named: "Loading1"))
            loadingState = .state1
        }
    }
}

// MARK: - PlaygroundLiveViewMessageHandler

extension LiveViewController: PlaygroundLiveViewMessageHandler {

    public func receive(_ message: PlaygroundValue) {
        switch message {
        case let .dictionary(dictionary):
            handleDictionary(dictionary)
        default:
            robotView.setLabel("Sorry, I only know how to read dictionaries!")
        }
    }

    private func handleDictionary(_ dictionary: [String: PlaygroundValue]) {
        guard
            case let .string(key)? = dictionary["key"],
            case let .string(value)? = dictionary["value"]
        else {
            robotView.setLabel("Sorry, I could not retrieve strings from the dictionary")
            return
        }

        switch key {
        case "name":
            greetUser(by: value)
        case "classicAnalyze":
            classicAnalyze(value)
        case "sentiment":
            analyze(value)
        case "say":
            say(value)
        default:
            robotView.setLabel("Sorry, I don't know this command")
        }
    }

    private func greetUser(by name: String) {
        if name != "<#your name#>" {
            startLoading()
            robotView.setLabel("...")
            after(2.0) { [weak self] in
                self?.stopLoading()
                let string: String = "Hello \(name), it is nice to meet you!"
                self?.robotView.setLabel(string)
                self?.robotBrain.say(string)
            }
        } else {
            robotView.setLabel("You have to tell me your name so I can say it. Mine is Smarty!")
        }
    }

    private func classicAnalyze(_ sentiment: String) {
        switch sentiment {
        case "Positive":
            robotView.setLabel("That is a Positive thing to say!")
        case "Neutral":
            robotView.setLabel("That is a Neutral text.")
        default:
            robotView.setLabel("Sorry, I don't know what to make of that.")
        }
    }

    private func analyze(_ text: String) {
        if #available(iOS 11.0, *) {
            robotBrain.delayBlink(by: 5.0)
            robotBrain.analyze(text)
        } else {
            robotView.setLabel("I need a higher version of iOS to run this feature :(")
        }
    }

    private func say(_ text: String) {
        robotView.setLabel(text)
        robotBrain.say(text)
    }
}

// MARK: - RobotBrainDelegate

extension LiveViewController: RobotBrainDelegate {
    public func robotShouldBlink() {
        robotView.setImage(UIImage(named: "Blink"))
    }

    public func robotShouldUnblink() {
        robotView.setImage(UIImage(named: "Idle"))
    }

    public func robotBrain(_ robotBrain: RobotBrain, sentiment: Sentiment, error: String?) {
        if let error = error {
            robotView.setLabel("Something went wrong! \(error)")
        } else {
            switch sentiment {
            case .neutral:
                robotView.setLabel("I have no strong feelings, one way or the other.")
                robotView.setImage(UIImage(named: "Neutral"))
            case .positive:
                robotView.setLabel("I have a positive sentiment analysis about this text!")
                robotView.setImage(UIImage(named: "Positive"))
            case .negative:
                robotView.setLabel("I have a Negative sentiment analysis about this text.")
                robotView.setImage(UIImage(named: "Negative"))
            }
        }
    }
}
