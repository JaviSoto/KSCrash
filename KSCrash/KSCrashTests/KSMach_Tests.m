//
//  KSMach_Tests.m
//
//  Created by Karl Stenerud on 2012-03-03.
//
//  Copyright (c) 2012 Karl Stenerud. All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall remain in place
// in this source code.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//


#import <SenTestingKit/SenTestingKit.h>

#import "KSMach.h"


@interface KSMach_Tests : SenTestCase @end

@implementation KSMach_Tests

- (void) testExceptionName
{
    NSString* expected = @"EXC_ARITHMETIC";
    NSString* actual = [NSString stringWithCString:ksmach_exceptionName(EXC_ARITHMETIC)
                                          encoding:NSUTF8StringEncoding];
    STAssertEqualObjects(actual, expected, @"");
}

- (void) testVeryHighExceptionName
{
    const char* result = ksmach_exceptionName(100000);
    STAssertTrue(result == NULL, @"");
}

- (void) testKernReturnCodeName
{
    NSString* expected = @"KERN_FAILURE";
    NSString* actual = [NSString stringWithCString:ksmach_kernelReturnCodeName(KERN_FAILURE)
                                          encoding:NSUTF8StringEncoding];
    STAssertEqualObjects(actual, expected, @"");
}

- (void) testVeryHighKernReturnCodeName
{
    const char* result = ksmach_kernelReturnCodeName(100000);
    STAssertTrue(result == NULL, @"");
}

@end
