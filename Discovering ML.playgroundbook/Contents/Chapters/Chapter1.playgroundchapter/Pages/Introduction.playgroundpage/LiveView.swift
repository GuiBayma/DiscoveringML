//
//  Page 1: Introduction
//  Live view
//

import PlaygroundSupport

let page: PlaygroundPage = PlaygroundPage.current
let controller: LiveViewController = LiveViewController()
controller.setIntroductionInitialState()
page.liveView = controller
