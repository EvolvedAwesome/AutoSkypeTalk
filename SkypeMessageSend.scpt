# The text to be sent
property textToSpam : ""

# The Amount of times to send the message
property timesToSpam : 0

# The time in between each message being sent
property timeBetweenMessageSend : 0

# Chosen Message from user input
display dialog "What message do you want to send?" default answer "Hi, this chat is moderated." buttons {"OK"} default button 1
set textToSpam to text returned of result

# Sets the amount of times to send the message
display dialog "How Many times should we send the message?" default answer "1000" buttons {"OK"} default button 1
set timesToSpam to text returned of result

# Sets the amount of time inbetween sending the messages
display dialog "How long should there be between the messages being sent? (Seconds)" default answer "60" buttons {"OK"} default button 1
set timeBetweenMessageSend to text returned of result

# Activates Skype
tell application "Skype"
	activate
end tell

# Waits for Skype to Initialize
# before sending the messages
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
