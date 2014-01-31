PACScrollView
=============

PACScrollView is a subclas of `UIScrollView` which allow you to add a background image, more or less blurred considering the scroll position.

![PACScrollView demo](https://github.com/claudot/PACScrollView/raw/master/PACScrollView.gif)

=========

## Changes

v 1.0

* First public release

v 1.0

* Support for iOS 4 & 5 & 6 & 7

## Getting started
### The Pod way
Just add the following line in your podfile

	pod 'PACScrollView'

### The old school way
Drag and drop the category files in your project and you are done.

### Using PACScrollView

#### Basic usage

First, import `PACBlurryScrollView.h` header in th e .h file.

XIB way :

just add a scrollView in your Xib file and change the class type to PACBlurryScrollView

then, add the following code 

```Objective-C
	[pacScrollView setBackgroundImage:[UIImage imageNamed:@"bg.jpg"]];
```

Code way

```Objective-C
    PACBlurryScrollView *pacScrollView = [[PACBlurryScrollView alloc] initWithFrame:self.view.bounds];
    [pacScrollView setBackgroundImage:[UIImage imageNamed:@"bg.jpg"]];
    [self.view addSubview:pacScrollView];
```

Don't forget to add content to your scrollView !

### Sample project
The sample project show how to use it with the Xib Way.

## Requirements
PACScrollView requires Xcode 5 as it use Accelerate framework

### ARC
PACScrollView uses ARC.  
If you are using PACScrollView in a non-arc project, you will need to set a `-fobjc-arc` compiler flag on every PACScrollView source files.  
To set a compiler flag in Xcode, go to your active target and select the "Build Phases" tab. Then select PACScrollView source files, press Enter, insert -fobjc-arc and then "Done" to enable ARC for PACScrollView.

## Contributing
Contributions for bug fixing or improvements are welcomed. Feel free to submit a pull request.

## Licence
PACScrollView is available under the MIT license. See the LICENSE file for more info.
