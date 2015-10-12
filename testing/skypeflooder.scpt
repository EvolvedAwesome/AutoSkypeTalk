# This shows a more evil use of the code to create a skype message spammer.
# Note that this code is provided for you to use educationally! Any other use
# is not condoned by me.

# The text to be spammed
property textToSpam : ""

# The Amount of times to spam
property timesToSpam : 0

# The Time In between each Spam message being sent
property timesBetweenSpam : 0.5

# Chosen Message from user input
display dialog "What message do you want to flood with?" default answer "I'm amazing" buttons {"OK"} default button 1
set textToSpam to text returned of result

# Sets the amount of times to spam
display dialog "How Many times should we flood skype?" default answer "1000" buttons {"OK"} default button 1
set timesToSpam to text returned of result

# Activates Skype
tell application "Skype"
	activate
end tell

# Waits for Skype to Initialize
# before flooding
delay 0.5

repeat timesToSpam times
	tell application "System Events"
		
		# Writes String as Keystrokes
		keystroke textToSpam
		
		# Sends Keystroke
		keystroke return
		
		# Delays between the messages 
		delay timesBetweenSpam
	end tell
end repeat
