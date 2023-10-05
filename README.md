# TabViewLostScrollPosition

This test project showcases an issue in SwiftUI's `TabView` where the contained views can lose their scroll position when the selected tab changes using the swipe gesture.

The included project has been done using Xcode 15.0 and tested under iOS 16 and iOS 17.0.

## Up to 3 tabs is fine

As you can see below, with 3 tabs the scroll position is maintained as we swipe from tab to tab:

https://github.com/yannxou/TabViewLostScrollPosition/assets/5954961/c53442a4-06a4-4c79-b6a0-86f0512bfeba


## What about 4?

If we do the same test with 4 tabs you'll notice that the tab #0 resets its scroll position when we come back after going through them all. Moreover, if we later go again to the right-most tab we can see it also lost its scroll position. Why is that?

https://github.com/yannxou/TabViewLostScrollPosition/assets/5954961/67aa065d-1fc8-4d40-9eae-b29da36207fa


This gets more interesting if we do the same test but using the `Picker` instead of the swipe gesture. In this case all scroll positions are maintained:

https://github.com/yannxou/TabViewLostScrollPosition/assets/5954961/a1820e9a-eb5a-442e-b075-6ac00552b5b1


## Some sort of explanation

It seems that `TabView` does keep somehow the state of all views since the scroll is maintained when using the `Picker` to change the tab or by programatically setting the `selection` binding. But when using the swipe gesture it looks like only the current tab, the previous one and next tab (based on the swipe direction) are kept. 

This is more evident if we do the test with 5 tabs:

https://github.com/yannxou/TabViewLostScrollPosition/assets/5954961/68431f4d-2014-422d-b4e7-b870b573a7d3


And again, everything's fine when using the `Picker` or updating programatically:

https://github.com/yannxou/TabViewLostScrollPosition/assets/5954961/6c1bf3e0-e533-4aa9-a342-81b40dbbd818


## Bug?

It would seem that this is a bug in the current `TabView` implementation. I hope this test project helps anyone else with the same issue and provides some context for a future fix.

