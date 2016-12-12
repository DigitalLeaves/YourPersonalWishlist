# About this sample code
One of the most recurrent topics when working with the MapKit framework and annotations is customising the annotations and callout views in the map to match the design of the application we are working on. Unfortunately, unless you want to stick to the most basic, iOS-looking styling, it’s not easy at all to do so, and the MapKit framework does not really give you the flexibility that you need for customising your map.

## Motivation
Apple example source code [“MapCallouts: Using MapKit Annotations”](https://developer.apple.com/library/content/samplecode/MapCallouts/Introduction/Intro.html) is just hideous, and doesn’t really address the problem of customising the map annotation views. There, in the image, you might see several pins. One of them (the one at the bottom with a “Tea garden” title and an image) might seem like a custom callout, but it’s not, it’s the annotation view. You cannot click on it (at least, nothing happens if you do so), it cannot contain buttons or any interactive elements… it’s just not what you would probably need for a modern application, and the other two pins will show you a “somewhat” customised callout, but you won’t be able to get a fully customised callout view using this code sample.

There are some code samples out there talking about customisation, but they either don’t get a full customisation or you end up with a callout whose elements are not interactive, i.e: buttons cannot be pushed, table views cannot be scrolled, etc…

[In this post](http://digitalleaves.com/blog/2016/12/building-the-perfect-ios-map-ii-completely-custom-annotation-views/), I describe a method for making completely custom annotation views that actually work, and are fully interactive (including inner buttons, table views, etc). This repository is the sample code project for that post. Please, visit the page to have an in-depth explanation of what's going on here.

![Project in action](https://github.com/DigitalLeaves/YourPersonalWishlist/blob/master/yourPersonalWishList.gif?raw=true "Project in action")


