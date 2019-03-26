//
//  Page 2: Improving
//  Live view
//

import PlaygroundSupport

let page: PlaygroundPage = PlaygroundPage.current
let controller: LiveViewController = LiveViewController()
controller.setImprovmentInitialState()
page.liveView = controller
