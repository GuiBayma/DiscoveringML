//#-hidden-code
//
//  Page 3 Sentiment
//  Contents
//

import PlaygroundSupport

func analyzeSentiment() {
    let page: PlaygroundPage = PlaygroundPage.current
    if let proxy = page.liveView as? PlaygroundRemoteLiveViewProxy {
        let dict = PlaygroundValue.dictionary(["key": .string("sentiment"),
                                               "value": .string(text)])
        proxy.send(dict)
    }
}
//#-end-hidden-code

/*:
 With the use of *ML* we improved Smarty, giving him access to a model that will help him decide some things.

 Basically Smarty can now analyze strings of text and decide if this text carries a good, a bad or a neutral sentiment.

 You can test this by inputing different strings below and pressing *Run My Code*. Then Smarty will tell you what he thinks!
 */

let text = /*#-editable-code */"<#I am having a great day!#>"/*#-end-editable-code*/
analyzeSentiment()

/*:
 Of course Smarty will not always guess correctly what the sentiment was, but some times neither do we!

 Considering he is analyzing a lot of sentences for the first time, without us telling him before hand, he is doing a pretty good job!

 And that is it! You can head on to the last page if you want, for some final messages.

 [Last page](@next)
 */
