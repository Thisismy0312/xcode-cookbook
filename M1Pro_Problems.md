## M1Pro Cocoapods问题
### Cocoapods install ERROR

```
pod install
```

**ERROR**
```
LoadError - dlopen(/Library/Ruby/Gems/2.6.0/gems/ffi-1.15.0/lib/ffi_c.bundle, 0x0009): missing compatible arch in /Library/Ruby/Gems/2.6.0/gems/ffi-1.15.0/lib/ffi_c.bundle - /Library/Ruby/Gems/2.6.0/gems/ffi-1.15.0/lib/ffi_c.bundle
 /System/Library/Frameworks/Ruby.framework/Versions/2.6/usr/lib/ruby/2.6.0/rubygems/core_ext/kernel_require.rb:54:in `require'
 /System/Library/Frameworks/Ruby.framework/Versions/2.6/usr/lib/ruby/2.6.0/rubygems/core_ext/kernel_require.rb:54:in `require'
 /Library/Ruby/Gems/2.6.0/gems/ffi-1.15.0/lib/ffi.rb:6:in `rescue in <top (required)>'
 /Library/Ruby/Gems/2.6.0/gems/ffi-1.15.0/lib/ffi.rb:3:in `<top (required)>'
 /System/Library/Frameworks/Ruby.framework/Versions/2.6/usr/lib/ruby/2.6.0/rubygems/core_ext/kernel_require.rb:54:in `require'
 /System/Library/Frameworks/Ruby.framework/Versions/2.6/usr/lib/ruby/2.6.0/rubygems/core_ext/kernel_require.rb:54:in `require'
 /Library/Ruby/Gems/2.6.0/gems/ethon-0.12.0/lib/ethon.rb:2:in `<top (required)>'
 /System/Library/Frameworks/Ruby.framework/Versions/2.6/usr/lib/ruby/2.6.0/rubygems/core_ext/kernel_require.rb:54:in `require'
 /System/Library/Frameworks/Ruby.framework/Versions/2.6/usr/lib/ruby/2.6.0/rubygems/core_ext/kernel_require.rb:54:in `require'
 /Library/Ruby/Gems/2.6.0/gems/typhoeus-1.4.0/lib/typhoeus.rb:2:in `<top (required)>'
 /System/Library/Frameworks/Ruby.framework/Versions/2.6/usr/lib/ruby/2.6.0/rubygems/core_ext/kernel_require.rb:54:in `require'
 /System/Library/Frameworks/Ruby.framework/Versions/2.6/usr/lib/ruby/2.6.0/rubygems/core_ext/kernel_require.rb:54:in `require'
 /Library/Ruby/Gems/2.6.0/gems/cocoapods-1.10.1/lib/cocoapods/sources_manager.rb:74:in `cdn_url?'
 /Library/Ruby/Gems/2.6.0/gems/cocoapods-1.10.1/lib/cocoapods/sources_manager.rb:36:in `create_source_with_url'
 /Library/Ruby/Gems/2.6.0/gems/cocoapods-1.10.1/lib/cocoapods/sources_manager.rb:21:in `find_or_create_source_with_url'
 /Library/Ruby/Gems/2.6.0/gems/cocoapods-1.10.1/lib/cocoapods/installer/analyzer.rb:178:in `block in sources'
 /Library/Ruby/Gems/2.6.0/gems/cocoapods-1.10.1/lib/cocoapods/installer/analyzer.rb:177:in `map'
 /Library/Ruby/Gems/2.6.0/gems/cocoapods-1.10.1/lib/cocoapods/installer/analyzer.rb:177:in `sources'
 /Library/Ruby/Gems/2.6.0/gems/cocoapods-1.10.1/lib/cocoapods/installer/analyzer.rb:1073:in `block in resolve_dependencies'
 /Library/Ruby/Gems/2.6.0/gems/cocoapods-1.10.1/lib/cocoapods/user_interface.rb:64:in `section'
 /Library/Ruby/Gems/2.6.0/gems/cocoapods-1.10.1/lib/cocoapods/installer/analyzer.rb:1072:in `resolve_dependencies'
 /Library/Ruby/Gems/2.6.0/gems/cocoapods-1.10.1/lib/cocoapods/installer/analyzer.rb:124:in `analyze'
 /Library/Ruby/Gems/2.6.0/gems/cocoapods-1.10.1/lib/cocoapods/installer.rb:414:in `analyze'
 /Library/Ruby/Gems/2.6.0/gems/cocoapods-1.10.1/lib/cocoapods/installer.rb:239:in `block in resolve_dependencies'
 /Library/Ruby/Gems/2.6.0/gems/cocoapods-1.10.1/lib/cocoapods/user_interface.rb:64:in `section'
 /Library/Ruby/Gems/2.6.0/gems/cocoapods-1.10.1/lib/cocoapods/installer.rb:238:in `resolve_dependencies'
 /Library/Ruby/Gems/2.6.0/gems/cocoapods-1.10.1/lib/cocoapods/installer.rb:160:in `install!'
 /Library/Ruby/Gems/2.6.0/gems/cocoapods-1.10.1/lib/cocoapods/command/install.rb:52:in `run'
 /Library/Ruby/Gems/2.6.0/gems/claide-1.0.3/lib/claide/command.rb:334:in `run'
 /Library/Ruby/Gems/2.6.0/gems/cocoapods-1.10.1/lib/cocoapods/command.rb:52:in `run'
 /Library/Ruby/Gems/2.6.0/gems/cocoapods-1.10.1/bin/pod:55:in `<top (required)>'
 /usr/local/bin/pod:23:in `load'
 /usr/local/bin/pod:23:in `<main>'
```

**Fix**
```
sudo arch -x86_64 gem install ffi
arch -x86_64 pod install
```
