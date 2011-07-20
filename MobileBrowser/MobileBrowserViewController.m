//
//  MobileBrowserViewController.m
//  MobileBrowser
//
//  Created by Raul Montero on 19/07/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MobileBrowserViewController.h"

@implementation MobileBrowserViewController

@synthesize address, webview, backButton, forwardButton, spinner;



#pragma mark - Local methods

- (void) loadUrlfromString
{
    NSURL *url = [NSURL URLWithString:self.address.text];
    [self.webview loadRequest:[NSURLRequest requestWithURL:url]];
}

- (void) resetButtons
{
    [self.backButton setEnabled:[webview canGoBack]];
    [self.forwardButton setEnabled:[webview canGoForward]];
}

- (void) disableWebView
{
    self.webview.userInteractionEnabled = NO;
    self.webview.alpha = 0.25;
}

- (void) enableWebView
{
    self.webview.userInteractionEnabled = YES;
    self.webview.alpha = 1;
}


#pragma mark - TextField Delegate methods

-(void) textFieldDidBeginEditing:(UITextField *)textField
{
    [self disableWebView];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField;              // called when 'return' key pressed. return NO to ignore.
{
    [self loadUrlfromString];
    [textField resignFirstResponder];
    [self enableWebView];
    return YES;
}

#pragma mark - WebView Delegate methods

- (void) webViewDidStartLoad:(UIWebView *)webView
{
    [self.spinner startAnimating];
}

- (void) webViewDidFinishLoad:(UIWebView *)webView
{
    [self.address setText:[[self.webview.request URL] absoluteString]];
    [self.spinner stopAnimating];
    [self resetButtons];
}

#pragma mark - Memory management

- (void)dealloc
{
    self.address = nil;
    self.webview = nil;
    self.backButton = nil;
    self.forwardButton = nil;
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}


#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.address.text = @"http://www.google.com";
    [self loadUrlfromString];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    self.address = nil;
    self.webview = nil;

    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
