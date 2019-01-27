function Show-Menu
{
     param (
           [string]$Title = 'My Menu'
     )
     cls
     Write-Host "================ $Title ================"
     
     Write-Host "1: Youtube - Video."
     Write-Host "2: Youtube - Audio."
     Write-Host "3: Facebook - Video."
	 Write-Host "4: Other Sites - Video."
}
do
{
     Show-Menu
     $input = Read-Host "Please make a selection"
     switch ($input)
     {

##Youtube Video
'1'{
                cls
                'You chose option #1'
cd "C:\Program Files\Youtube Download"
$URL = Read-Host -Prompt 'Input the Youtube URL'
.\youtube-dl.exe "$URL" -i -o '~\Desktop\Youtube Videos/%(title)s.%(ext)s' -f bestvideo+bestaudio/best --merge-output-format mkv
}

##Youtube Audio
'2'{
                cls
cd "C:\Program Files\Youtube Download"
$URL = Read-Host -Prompt 'Input the Youtube URL'
.\youtube-dl.exe -f bestaudio --extract-audio --audio-format mp3 --audio-quality 5 "$URL" -i -o '~\Desktop\Youtube Music/%(title)s.%(ext)s'
           } 
		   
##Facebook Video
'3' {
                cls
cd "C:\Program Files\Youtube Download"
$URL = Read-Host -Prompt 'Input the Facebook Video URL'
$USERNAME = Read-Host -Prompt "Input the Facebook Username - Only needed if it's a private group video"
$PASSWORD = Read-Host -Prompt "Input the Facebook Password - Only needed if it's a private group video"
.\youtube-dl.exe "$URL" -i -o '~\Desktop\Facebook Videos/%(title)s.%(ext)s' -f bestvideo+bestaudio/best --merge-output-format mkv --continue --username "$USERNAME" --password "$PASSWORD"
           } 
##Other Videos
'4'{
                cls
                'You chose option #4'
cd "C:\Program Files\Youtube Download"
$URL = Read-Host -Prompt 'Input URL'
.\youtube-dl.exe "$URL" -i -o '~\Desktop\Other Videos/%(title)s.%(ext)s' -f bestvideo+bestaudio/best --merge-output-format mkv
}

		   
##To be able to Quit out of the menu		   
'q'{
                return
           }
##Youtube Video
'A'{
                cls
                'You are now in Advanced Settings'
				
}
     }
	 Write-Host "Complete!!!"
     pause
}
until ($input -eq 'q')