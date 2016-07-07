# https://github.com/mathiasbynens/custom.keylayout/issues/7#issuecomment-126970143

dep 'keyboard - show input menu in login window', template: 'plist' do
  file '/Library/Preferences/com.apple.loginwindow'
  key 'showInputMenu'
  want '1'
  write '-bool true'
end

# dep '', template: 'plist' do
#   file '/Library/Preferences/com.apple.HIToolbox'
#   key 'AppleCurrentKeyboardLayoutInputSourceID'
#   want 'com.apple.keylayout.US'
#   write ''
# end

# dep '', template: 'plist' do
#   file '/Library/Preferences/com.apple.HIToolbox'
#   key 'AppleDefaultAsciiInputSource'
#   want '{
#     InputSourceKind = "Keyboard Layout";
#     "KeyboardLayout ID" = 0;
#     "KeyboardLayout Name" = "U.S.";
# }'
#   write ''
# end

# dep '', template: 'plist' do
#   file '/Library/Preferences/com.apple.HIToolbox'
#   key 'AppleEnabledInputSources'
#   want '(
#         {
#         InputSourceKind = "Keyboard Layout";
#         "KeyboardLayout ID" = 12825;
#         "KeyboardLayout Name" = Colemak;
#     },
#         {
#         InputSourceKind = "Keyboard Layout";
#         "KeyboardLayout ID" = 0;
#         "KeyboardLayout Name" = "U.S.";
#     }
# )'
#   write ''
# end

# dep '', template: 'plist' do
#   file '/Library/Preferences/com.apple.HIToolbox'
#   key 'AppleInputSourceHistory'
#   want '(
#         {
#         InputSourceKind = "Keyboard Layout";
#         "KeyboardLayout ID" = 0;
#         "KeyboardLayout Name" = "U.S.";
#     },
#         {
#         InputSourceKind = "Keyboard Layout";
#         "KeyboardLayout ID" = "-28675";
#         "KeyboardLayout Name" = "Colemak Mod-DH";
#     },
#         {
#         InputSourceKind = "Keyboard Layout";
#         "KeyboardLayout ID" = 12825;
#         "KeyboardLayout Name" = Colemak;
#     }
# )'
#   write ''
# end