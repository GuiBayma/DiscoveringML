//
//  Page 4: Acknowledgement
//  Live view
//

import PlaygroundSupport

let page: PlaygroundPage = PlaygroundPage.current
let controller: LiveViewController = LiveViewController()
controller.setAcknowledgementInitialState()
page.liveView = controller
