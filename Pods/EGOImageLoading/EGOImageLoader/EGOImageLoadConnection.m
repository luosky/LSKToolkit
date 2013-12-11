//
//  EGOImageLoadConnection.m
//  EGOImageLoading
//
//  Created by Shaun Harrison on 12/1/09.
//  Copyright (c) 2009-2010 enormego
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "EGOImageLoadConnection.h"


@implementation EGOImageLoadConnection
@synthesize imageURL=_imageURL, response=_response, delegate=_delegate, timeoutInterval=_timeoutInterval;

#if __EGOIL_USE_BLOCKS
@synthesize handlers;
#endif

- (id)initWithImageURL:(NSURL*)aURL delegate:(id)delegate {
	if((self = [super init])) {
		_imageURL = [aURL retain];
		self.delegate = delegate;
		_responseData = [[NSMutableData alloc] init];
		self.timeoutInterval = 30;
		
        _fileSize = -1;
		#if __EGOIL_USE_BLOCKS
		handlers = [[NSMutableDictionary alloc] init];
		#endif
	}
	
	return self;
}

- (void)start {
	NSMutableURLRequest* request = [[NSMutableURLRequest alloc] initWithURL:_imageURL
																cachePolicy:NSURLRequestReloadRevalidatingCacheData
															timeoutInterval:_timeoutInterval];
	[request setValue:@"gzip" forHTTPHeaderField:@"Accept-Encoding"];  
	_connection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:NO];
    [_connection scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    [_connection start];
	[request release];
}

- (void)cancel {
	[_connection cancel];	
}

- (NSData*)responseData {
	return _responseData;
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
	if(connection != _connection) return;
	[_responseData appendData:data];
    
    if (_fileSize && _fileSize >= 0
        && [_delegate respondsToSelector:@selector(imageLoadConnectionNeedProgress:)]
        && [_delegate respondsToSelector:@selector(imageLoadConnection:progress:)]){
        
        if ([_delegate imageLoadConnectionNeedProgress:self]) {
            float progress = [_responseData length] / (float)_fileSize;
            [_delegate imageLoadConnection:self progress:progress];
        }
    }

}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
	if(connection != _connection) return;
	self.response = response;
    if ([(NSHTTPURLResponse*)response statusCode] == 200) {
        _fileSize = [response expectedContentLength];
    }
    
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
	if(connection != _connection) return;

	if([_delegate respondsToSelector:@selector(imageLoadConnectionDidFinishLoading:)]) {
		[_delegate imageLoadConnectionDidFinishLoading:self];
	}
    
    _fileSize = -1;
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
	if(connection != _connection) return;

	if([_delegate respondsToSelector:@selector(imageLoadConnection:didFailWithError:)]) {
		[_delegate imageLoadConnection:self didFailWithError:error];
	}
    
    _fileSize = -1;
}


- (void)dealloc {
	self.response = nil;
	self.delegate = nil;
	
	#if __EGOIL_USE_BLOCKS
	[handlers release], handlers = nil;
	#endif

	[_connection release];
	[_imageURL release];
	[_responseData release];
	[super dealloc];
}

@end
