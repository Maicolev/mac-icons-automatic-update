on run
	-- Get the user's home directory
	set userHome to (system attribute "HOME")

	-- Path to custom icons
	set spotifyIconPath to userHome & "/Documents/icons/spotify.icns"
	set slackIconPath to userHome & "/Documents/icons/electron.icns"
	set warpIconPath to userHome & "/Documents/icons/Warp.icns"
	
	-- Spotify (Example application on an external disk)
	set spotifyAppPath to "/Volumes/ExternalDisk/Spotify/Spotify.app"
	set spotifyAliasPath to "/Applications/Spotify.app"
	set spotifyAppIconPath to spotifyAppPath & "/Contents/Resources/Icon.icns"
	
	-- Slack (Example application on the main disk)
	set slackAppPath to "/Applications/Slack.app"
	set slackAppIconPath to slackAppPath & "/Contents/Resources/electron.icns"
	
	-- Warp (Example with an icon in multiple locations)
	set warpAppPath to "/Applications/Warp.app"
	set warpAppIconPath to warpAppPath & "/Contents/Resources/Warp.icns"
	set warpDockIconPath to warpAppPath & "/Contents/PlugIns/WarpDockTilePlugin.docktileplugin/Contents/Resources/blue.png"
	
	-- Replace icons inside the application bundles
	do shell script "cp -f " & quoted form of spotifyIconPath & " " & quoted form of spotifyAppIconPath
	do shell script "cp -f " & quoted form of slackIconPath & " " & quoted form of slackAppIconPath
	do shell script "cp -f " & quoted form of warpIconPath & " " & quoted form of warpAppIconPath
	do shell script "rm -f " & quoted form of warpDockIconPath
	do shell script "cp -f " & quoted form of warpIconPath & " " & quoted form of warpDockIconPath
	
	-- Change icons in Finder
	tell application "Finder"
		try
			-- Spotify
			set spotifyIconRef to POSIX file spotifyIconPath as alias
			set spotifyTargetRef to POSIX file spotifyAliasPath as alias
			set spotifyAppRef to POSIX file spotifyAppPath as alias
			set icon of spotifyTargetRef to spotifyIconRef
			set icon of spotifyAppRef to spotifyIconRef
			
			-- Slack
			set slackIconRef to POSIX file slackIconPath as alias
			set slackAppRef to POSIX file slackAppPath as alias
			set icon of slackAppRef to slackIconRef
			
			-- Warp
			set warpIconRef to POSIX file warpIconPath as alias
			set warpAppRef to POSIX file warpAppPath as alias
			set icon of warpAppRef to warpIconRef
		end try
	end tell
	
	-- Ask before restarting Finder and Dock
	display dialog "Do you want to restart Finder and Dock to apply changes?" buttons {"No", "Yes"} default button "Yes"
	if the button returned of the result is "Yes" then
		do shell script "killall Finder"
		do shell script "killall Dock"
	end if
end run
