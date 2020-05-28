<# 

.SYNOPSIS
	Purpose of this script is to showcase the Write-Progress feature

.DESCRIPTION
	Script will enumate mailboxes within the current scope and simply loop through them.
	As it loops, progress will be displayed using the Write-Progress.

	An artificial pause is used to prevent script from completing too quickly in small test labs.


.ASSUMPTIONS
	You want to use Write-Progress 

	You can live with the Write-Host cmdlets :) 

	You can add your error handling if you need it.  

	

.VERSION
  
	1.0  	12-2-2015 -- Initial script released to the scripting gallery 
	

    
This Sample Code is provided for the purpose of illustration only and is not intended to be used in a production environment.  
THIS SAMPLE CODE AND ANY RELATED INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR IMPLIED, 
INCLUDING BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR PURPOSE.  
We grant You a nonexclusive, royalty-free right to use and modify the Sample Code and to reproduce and distribute the object code form of the Sample Code, 
provided that You agree: 
(i) to not use Our name, logo, or trademarks to market Your software product in which the Sample Code is embedded; 
(ii) to include a valid copyright notice on Your software product in which the Sample Code is embedded; and 
(iii) to indemnify, hold harmless, and defend Us and Our suppliers from and against any claims or lawsuits, including attorneys’ fees, that arise or result from the use or distribution of the Sample Code.
Please note: None of the conditions outlined in the disclaimer above will supercede the terms and conditions contained within the Premier Customer Services Description.
This posting is provided "AS IS" with no warranties, and confers no rights. 

Use of included script samples are subject to the terms specified at http://www.microsoft.com/info/cpyright.htm.

#>

# Get all mailboxes within the current scope.  ResultSize unlimited gets more than the default 1,000 mailboxes 
$Mailboxes = Get-Mailbox -ResultSize Unlimited

# Use an array around the $Mailboxes to work out the count.  Needed for later to display the progress bar
$Count = @($Mailboxes).count


# Loop me baby! 
ForEach ($Mailbox In $Mailboxes)
{
	# Write a handy dandy progress bar to the screen so that we know how far along this is...
	# Increment the counter 
	$Int = $Int + 1
	# Work out the current percentage 
	$Percent = $Int/$Count * 100
	
	# Write the progress bar out with the necessary verbiage....
	Write-Progress -Activity "Collecting Mailbox details" -Status "Processing Mailbox $Int of $Count - $Mailbox" -PercentComplete $Percent 
	
	# This is where we would do something with the given mailbox or whatever.
	# For demonstration purposes write out the mailbox name in Magenta.  Why magenta?  Why not?  Every script should have magenta! 

	
	Write-Host "Processing Mailbox $Mailbox" -ForegroundColor Magenta
	Write-Host

	
	# Artificial pause for demonstration purposes.  Remove these lines for production usage 
	# If running against 10 mailboxes it will fly past with the speed of 100 gazelles.....
	Start-Sleep 1

}