# Variable Prototypes

# The Skype Username to send messages to
set recipient to ""

# The text to be sent
set textToSend to ""

# The Amount of times to send the message
set timesToSend to 0

# The time in between each message being sent
set timeBetweenMessageSend to 0

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

# Sets the username to send message to
display dialog "What is the username of the person you want to send messages to." default answer "echo123" buttons {"OK"} default button 1
set recipient to text returned of result

# Activates Skype
tell application "Skype"
	activate
end tell

# Waits for Skype to Initialize
delay skypeInitWaitTime

repeat timesToSend times
	tell application "System Events"
		
		# Send the text through skype to the specified username.
		tell application "Skype"
			send command "MESSAGE " & recipient & " " & textToSend script name "messagesend"
		end tell
		
		# Delays between the messages 
		delay timeBetweenMessageSend
	end tell
end repeat
