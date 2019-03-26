//#-hidden-code
//
//  Page 2 Improving
//  Contents
//

import PlaygroundSupport

func analyze(_ sentiment: String) {
    let page: PlaygroundPage = PlaygroundPage.current
    if let proxy = page.liveView as? PlaygroundRemoteLiveViewProxy {
        let dict = PlaygroundValue.dictionary(["key": .string("classicAnalyze"),
                                               "value": .string(sentiment)])
        proxy.send(dict)
    }
}
//#-end-hidden-code

/*:
 As we discovered on the last page, Smarty is able to say your name. But... He is really just repeating whatever is set in the constant `yourName`. Not unlike a parrot!

 We can write `Pancakes` and Smarty would just say hello to someone named Pancakes. Maybe he prefers eggs!

 However there is a way we can make Smarty live up to his name. We can use *Machine Learning*.

 Using Machine Learning, or simply ML, we can teach Smarty to calculate and predict answers that would otherwise be too complicated.

 In classic programming we would do something like this:
 */

 var sentiment: String = "Neutral"
 let text = "I am very happy today!"

 if text.contains("happy") {
    sentiment = "Positive"
 }

 analyze(sentiment)

/*:
 Hit *Run My Code* and, as predicted Smarty will find this text a positive one. But that is not that great right?

 For instance if we change the `text` string to something different the predicted sentiment will probably be `Neutral`. To improve we would need to keep adding lines of code, and even then it will probably fail a lot.

 Let's go to the next page and see what Smarty can do with the help of *ML*.

 [Go to next page](@next)
 */
