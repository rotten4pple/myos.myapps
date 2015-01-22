/*
 Copyright © 2014 myOS Group.
 
 This application is free software; you can redistribute it and/or
 modify it under the terms of the GNU Lesser General Public
 License as published by the Free Software Foundation; either
 version 2 of the License, or (at your option) any later version.
 
 This library is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 Lesser General Public License for more details.
 
 Contributor(s):
 Amr Aboelela <amraboelela@gmail.com>
 */

#import <UIKit/UIKit-private.h>
#import "PageView.h"
#import "LauncherView.h"
#import "ApplicationsData.h"

#define _kIconWidth                 80
#define _kIconHeight                92
#define _kUIPageControlHeight       20

@implementation LauncherView

#pragma mark - Life cycle

- (id)initWithFrame:(CGRect)theFrame
{
    self = [super initWithFrame:theFrame];
    if (self) {
        ApplicationsData *applicationsData = [ApplicationsData sharedData];
        int numberOfPages = applicationsData->_applicationsPages.count;
        PageView *pageView = nil;
        self.contentSize = CGSizeMake(theFrame.size.width * numberOfPages, theFrame.size.height);
        self.pagingEnabled = YES;
        //DLog(@"numberOfPages: %d", numberOfPages);
        for (int i=0; i<numberOfPages; i++) {
            pageView = [[PageView alloc]
                        initWithFrame:CGRectMake(self.frame.origin.x + i * self.frame.size.width, self.frame.origin.y,
                                                 self.frame.size.width, self.frame.size.height)
                        andApplicationsPage:[applicationsData->_applicationsPages objectAtIndex:i]
                        andParentScrollView:self];
            [self addSubview:pageView];
            [pageView release];
        };
        //pageView.center = CGPointMake(pageView.center.x, pageView.center.y);
        //DLog();
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

#pragma mark - Actions

@end
