//#-hidden-code
//
//  Page 4 Acknowledgement
//  Contents
//

import PlaygroundSupport

func makeSmartySay(_ text: String) {
    let page: PlaygroundPage = PlaygroundPage.current
    if let proxy = page.liveView as? PlaygroundRemoteLiveViewProxy {
        let dict = PlaygroundValue.dictionary(["key": .string("say"),
                                               "value": .string(text)])
        proxy.send(dict)
    }
}
//#-end-hidden-code

/*:
 Thank you for reading `Discovering ML`, I hope you enjoyed it.

 This playgroundbook was created by Guilherme Bayma on March 2019 for Apple`s WWDC Scholarship program

 Vadym Markov is the author of the model used (`SentimentPolarity`). [This](https://github.com/cocoa-ai/SentimentCoreMLDemo) is the source

 The [background image](https://pixabay.com/vectors/circuit-board-pcb-computer-3773755/) was downloaded from [pixabay](https://pixabay.com)

 All Smarty `faces` were made using [Keynote](https://www.apple.com/lae/keynote/)
*/

/*:
 Also, if you had as much fun as me making Smarty say things (after all, this is a playground), go ahead and input any text down below (they work better in english). You probably know the drill by now, but don't forget to press *Run My Code*!
 */

makeSmartySay(/*#-editable-code */"<#what do you want me to say?#>"/*#-end-editable-code*/)
