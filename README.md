# ExpandingView
A simple animated UIView written in **Swift**, which expands to fullscreen when tapped and closes on a swipe down gesture.

*Usage in Storyboards is supported!*

## Usage
To make the view circular as in Instagram/Messenger stories for example, set
``` Swift
isCircular = true
```
To change the animation speed, set
``` Swift
expandAnimationDuration = 0.35
```

## UIView Inheritance

Want to use this on something else rather than a `UIView`? You change the super class to anything which inherits from `UIView`, such as `UIImageView`.
