//
//  Page 3: Sentiment
//  Live view
//

import PlaygroundSupport

let page: PlaygroundPage = PlaygroundPage.current
let controller: LiveViewController = LiveViewController()
controller.setSentimentInitialState()
page.liveView = controller
