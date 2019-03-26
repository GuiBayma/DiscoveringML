//#-hidden-code
//
//  Page 1: Introduction
//  Contents
//

import PlaygroundSupport

func sayName() {
    let page: PlaygroundPage = PlaygroundPage.current
    if let proxy = page.liveView as? PlaygroundRemoteLiveViewProxy {
        let dict = PlaygroundValue.dictionary(["key": .string("name"),
                                               "value": .string(yourName)])
        proxy.send(dict)
    }
}
//#-end-hidden-code

/*:
 Welcome!

 As you may have noticed the little guy on the right is a robot!

 His name is Smarty and he can learn how to say your name.

 To do that we can use the few lines of code down below; Just click and enter your name in the constant `yourName` and then press the button *Run My Code* located at the bottom right of the page, below Smarty
 */

let yourName = /*#-editable-code */"<#your name#>"/*#-end-editable-code*/
sayName()

/*:
 Pretty cool right? And that is just the begining.
 
 Why don't we head on to the next page and let's see just how cleaver this robot can be.
 
 [Go to next page](@next)
 */
