# The text to be sent
property textToSend : ""

# The Amount of times to send the message
property timesToSend : 0

# The time in between each message being sent
property timeBetweenMessageSend : 0

# Bool whether to active skype on every keypress iteration
property activeSkypeOnKeypress : ""

# The waitTime to let skype initalize
set skypeInitWaitTime to 0.5

# Chosen Message from user input
display dialog "What message do you want to send?" default answer "Hi, this chat is moderated." buttons {"OK"} default button 1
set textToSend to text returned of result

# Sets the amount of times to send the message
display dialog "How Many times should we send the message?" default answer "1000" buttons {"OK"} default button 1
set timesToSend to text returned of result

# Sets the amount of time inbetween sending the messages
display dialog "How long should there be between the messages being sent? (Seconds)" default answer "60" buttons {"OK"} default button 1
set timeBetweenMessageSend to text returned of result

# Sets whether shkye should activate on each keypress iteration
display dialog "Should the program activate skype on every keypress iteration or not? (Yes or No)" default answer "No" buttons {"Ok"} default button 1
set activateSkypeOnKeypress to text returned of result

# Activates Skype
tell application "Skype"
	activate
end tell

# Waits for Skype to Initialize
delay skypeInitWaitTime

repeat timesToSend times
	tell application "System Events"
		
		if activateSkypeOnKeypress = "Yes" then
			tell application "Skype"
				activate
			end tell
		end if
		
		# Waits for skype to Initalize
		delay skypeInitWaitTime
		
		# Writes String as Keystrokes
		keystroke textToSend
		
		# Sends Keystroke enter
		keystroke return
		
		# Delays between the messages 
		delay timeBetweenMessageSend
	end tell
end repeat
