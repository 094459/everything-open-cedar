// Policy0 - ALLOW for the Joe Public

// permit (
//   principal in PhotoApp::User::"JoePublic", 
//   action == PhotoApp::Action::"viewPhoto", 
//   resource in PhotoApp::Album::"DoePublicPhotos"
// );

// Policy0a - ALLOW Public access for only authenticated users

// permit (
//   principal, 
//   action == PhotoApp::Action::"viewPhoto", 
//   resource in PhotoApp::Album::"DoePublicPhotos"
// )
// when { context has authenticated && context.authenticated == true };


// Policy1 - ALLOW for the Doe's to view Private Photos
//   action in [PhotoApp::Action::"viewPhoto", PhotoApp::Action::"managePhoto"],
// permit (
//   principal in PhotoApp::UserGroup::"DoeFamily", 
//   action == PhotoApp::Action::"viewPhoto",
//   resource in PhotoApp::Album::"DoePhotos"
// );

// Policy2 - ALLOW only access to pics where you are the owner
// in this case, only JaneDoe is the owner. JohnDoe will not get access
// permit (
//   principal in PhotoApp::UserGroup::"DoeFamily", 
//   action == PhotoApp::Action::"viewPhoto",
//   resource in PhotoApp::Album::"DoePhotos"
// )
// when { resource.owner == principal };

// policy3 - ALLOW for the Doe's to manage Photos
// permit (
//   principal in PhotoApp::UserGroup::"DoeFamily", 
//   action == PhotoApp::Action::"managePhoto", 
//   resource in PhotoApp::Album::"DoePhotos"
// );

// policy3a - ALLOW for the Doe's to manage Photos who own the album
// permit (
//   principal in PhotoApp::UserGroup::"DoeFamily", 
//   action == PhotoApp::Action::"managePhoto", 
//   resource in PhotoApp::Album::"DoePhotos"
// )
// when { resource.owner == principal };

// policy3b - FORBID access for the Doe's to manage Photos unless you are the owner the album
// forbid (
//   principal, 
//   action == PhotoApp::Action::"managePhoto", 
//   resource in PhotoApp::Album::"DoePhotos"
// )
// unless { resource.owner == principal };

// policy3c - ALLOW for the Doe's to manage Photos when MFA is true
// permit (
//   principal in PhotoApp::UserGroup::"DoeFamily", 
//   action == PhotoApp::Action::"managePhoto", 
//   resource in PhotoApp::Album::"DoePhotos"
// )
// when { context has MFAEnable && context.MFAEnable == true };

//policy4 - ALLOW for Admin User principals
// permit (
//   principal == PhotoApp::User::"admin", 
//   action, 
//   resource
// );

// policy5 - ALLOW for ric User to view photos
// permit (
//   principal == PhotoApp::User::"ric", 
//   action == PhotoApp::Action::"viewPhoto", 
//   resource
// );


// policy6 - ALLOW for ric User to be siteadmin
// permit (
//   principal == PhotoApp::User::"ric", 
//   action == PhotoApp::Action::"siteAdmin", 
//   resource
// );

// policy6a - ALLOW for ric User to be siteadmin only from specific IP
// permit (
//   principal == PhotoApp::User::"ric", 
//   action == PhotoApp::Action::"siteAdmin", 
//   resource
// )
// when { context has ip && context.ip.isInRange(ip("10.44.1.0/24")) };

// policy6b - ALLOW for ric User to be siteadmin only from specific IP
// permit (
//   principal == PhotoApp::User::"ric", 
//   action == PhotoApp::Action::"siteAdmin", 
//   resource
// )
// when { context has ip && context.ip.isInRange(ip("11.44.1.0/24")) };