![logo](https://github.com/joeldev/ADNKit/raw/master/Images/adnkit.png)

ADNKit is a brand new Objective-C framework for building App.net iOS and OS X applications. The guiding design principles are:
* Simple and easy to understand API, designed for making things happen quickly
* As much heavylifting as possible is done for you
* 100% App.net API support
* No external dependencies other than AFNetworking

It's also important to note that many parts of core architecture in this framework is based on [Matt Rubin](https://github.com/mattrubin)'s fantastic architectural work in his [AppDotNet](https://github.com/mattrubin/AppDotNet) project. My hat's off to him for designing a truly excellent framework architecture and open sourcing it!

# Getting Started
Please see [the wiki](https://github.com/joeldev/ADNKit/wiki) for full documentation.

### Installation
ADNKit makes use of submodules for its dependencies. After cloning the repo, make sure to run `git submodule update --init --recursive` from the top level before trying to build the code. There is also a Releases folder containing stable binary releases.

**It's also important to note that AFNetworking is compiled in as part of the library and does not need to be added to your project.**

### Hello, world!

##### Authentication

[More information about authentication with ADNKit](https://github.com/joeldev/ADNKit/wiki/Authentication), including how to set up and implement both Username/Password and OAuth authentication.

```objc
/* this assumes you have two text fields, usernameField and passwordField */

// ask for permission to see user information and send new Posts
ANKAuthScope requestedScopes = ANKAuthScopeBasic | ANKAuthScopeWritePost;

// handler to call when finished authenticating
id handler = ^(BOOL success, NSError *error) {
	if (success) {
		NSLog(@"we are authenticated and ready to make API calls!");
	} else {
		NSLog(@"could not authenticate, error: %@", error);
	}
};

// authenticate, calling the handler block when complete
[[ANKClient sharedClient] authenticateUsername:usernameField.text
									  password:passwordField.text
									  clientID:@"xxxxxx"
						   passwordGrantSecret:@"zzzzzz"
						         	authScopes:requestedScopes
						     completionHandler:handler];
```

Once the completion block is called with a successful response, you are completely good to go and can start using the rest of the API calls immediately.

##### Creating Posts

Now that we are authenticated with App.net, let's make our inaugural Post:

```objc
[[ANKClient sharedClient] createPostWithText:@"Hello, world!" completion:^(ADNPost *post, NSError *error) {
    NSLog(@"post created! %@", post ?: error);
}];
```

It's just that easy! You should see a new post from yourself in your stream, and a Post object in your console!

You could have also achieved the same thing with:
```objc
ADNPost *post = [[ADNPost alloc] init];
post.text = @"Hello, world!";
[[ANKClient sharedClient] createPost:post completion:^(ADNPost *post, NSError *error) {
    NSLog(@"post created! %@", post ?: error);
}];
```
Using the model objects directly lets you set them up completely (such as setting post.annotations). There is not a convenience method for everything, so more advanced situations are intended to be handled by creating the model object, setting it up how you want it, and then sending it to the server.

# Documentation

Documentation is currently being kept [on the wiki](https://github.com/joeldev/ADNKit/wiki).

# Dependencies
ADNKit uses the following dependencies:
* [AFNetworking](https://github.com/AFNetworking/AFNetworking)

The following built-in frameworks are used:
* CoreLocation.framework
* SystemConfiguration.framework
* MobileCoreServices.framework (iOS only)

# License
BSD 3-Clause License:
> Copyright (c) 2013, Joel Levin. All rights reserved.
 
> Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 
>*  Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
* Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
* Neither the name of ADNKit nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

> THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.