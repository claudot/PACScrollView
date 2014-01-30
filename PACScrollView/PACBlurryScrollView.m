//
// The MIT License (MIT)
//
// Copyright (c) 2014 Paul-Anatole CLAUDOT
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import <objc/runtime.h>
#import <QuartzCore/QuartzCore.h>

// Class
#import "PACBlurryScrollView.h"

// Categories
#import "UIImage+PACBlurryEffect.h"

const char * const PACImageStoreKey = "pac.scrollview.image";

@interface PACBlurryScrollView ()

@property (strong, nonatomic) CALayer *backgroundImageLayer;
@property (strong, nonatomic) CALayer *backgroundBlurryImageLayer;

@end

@implementation PACBlurryScrollView

#pragma mark - Observe Offset

- (void)setContentOffset:(CGPoint)contentOffset
{
    [self updateImagesForScrollContent];
    [super setContentOffset:contentOffset];
}

- (void)updateImagesForScrollContent
{
   [CATransaction begin];
   [CATransaction setDisableActions: YES];
    
    [_backgroundImageLayer setOpacity:(1.0f - (self.contentOffset.y / (self.contentSize.height - self.frame.size.height)))];
    [_backgroundBlurryImageLayer setOpacity:(1.0f - _backgroundImageLayer.opacity)];
    
    [CATransaction commit];
}

#pragma mark - Getter and Setter

- (void)setBackgroundImage:(UIImage *)backgroundImage
{
    if (backgroundImage != [self backgroundImage]) {
        objc_setAssociatedObject(self, PACImageStoreKey, backgroundImage, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        [self updateBackgroundImages];
    }
}

- (UIImage *)backgroundImage
{
    return (UIImage *) objc_getAssociatedObject(self, PACImageStoreKey);
}

#pragma mark - UI updates

- (void)updateBackgroundImages
{
    // Background Image
    if (_backgroundImageLayer == nil) {
        _backgroundImageLayer = [[CALayer alloc] init];
        [self.layer insertSublayer:_backgroundImageLayer atIndex:0];
    }
    _backgroundImageLayer.contents = (id)[self backgroundImage].CGImage;
    [_backgroundImageLayer setFrame:CGRectMake(0.0f, 0.0f, [[self backgroundImage] size].width, [[self backgroundImage] size].height)];
    
    // Background Blurry Image
    UIImage *blurryImage = [[self backgroundImage] blurryEffectImage];
    if (_backgroundBlurryImageLayer == nil) {
        _backgroundBlurryImageLayer = [[CALayer alloc] init];
        [_backgroundImageLayer setOpacity:0.0f];
        [self.layer insertSublayer:_backgroundBlurryImageLayer above:_backgroundImageLayer];
    }
    _backgroundBlurryImageLayer.contents = (id)blurryImage.CGImage;
    [_backgroundBlurryImageLayer setFrame:CGRectMake(0.0f, 0.0f, [[self backgroundImage] size].width, [[self backgroundImage] size].height)];
}

#pragma mark - layout

-(void) layoutSubviews
{
    [super layoutSubviews];
    [self positionBackgroundLayer];
}

-(void)positionBackgroundLayer
{
    [CATransaction begin];
    [CATransaction setDisableActions: YES];
    
    CGFloat yOffset = self.contentOffset.y;
    CGRect frame = _backgroundImageLayer.frame;
    frame.origin.y = yOffset;
    [_backgroundImageLayer setFrame:frame];
    [_backgroundBlurryImageLayer setFrame:frame];
    
    [CATransaction commit];
    
}

@end
