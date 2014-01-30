PACScrollView
=============

PACScrollView is a subclass on UIScrollView that allow you to set an image and blurry it on scroll.

This class is available on iOS 4.0 to 7.1
It add CALayer on scrollView with two images. The user is not confused with subViews on it scrollView

![PACScrollView demo](https://github.com/claudot/PACScrollView/blob/master/PACScrollView.gif "Sample project animation")

Changes

v 1.0

First public release
v 1.0

Support for iOS 4 & 5 & 6 & 7
v 1.0

Getting started

The Pod way

Just add the following line in your podfile

pod 'PACScrollView'
The old school way

Drag and drop the class files in your project and you are done.

Using PACScrollView

Basic usage

First, import PACScrollView.h header in your .h file.

You can make an instance on your code or directly add it in your Xib file on modifying the class type to PACScrollView

Then you just add to set the property (based on associated storage) backgroundImage and the job is done !

    // With Xib
    [_pacScrollView setBackgroundImage:[UIImage imageNamed:@"bg.jpg"]];
    
or

    // In in code
    PACBlurryScrollView *pacScrollView = [[PACBlurryScrollView alloc] initWithFrame:self.view.bounds];
    [pacScrollView setBackgroundImage:[UIImage imageNamed:@"bg.jpg"]];
    [self.view addSubview:pacScrollView];
    
don't forget to add content in your scrollView and to set the background color to clearColor

The sample project show how to use it

Requirements

PACScrollView requires Xcode 5 as it uses accelerate and runtime routines. You can use iOS 4 as a target deployment version.

ARC

PACScrollView uses ARC.
If you are using PACScrollView in a non-arc project, you will need to set a -fobjc-arc compiler flag on every PACScrollView source files.
To set a compiler flag in Xcode, go to your active target and select the "Build Phases" tab. Then select PACScrollView source files, press Enter, insert -fobjc-arc and then "Done" to enable ARC for PACScrollView.

Contributing

Contributions for bug fixing or improvements are welcomed. Feel free to submit a pull request.

Licence

MaryPopin is available under the MIT license. See the LICENSE file for more info.
