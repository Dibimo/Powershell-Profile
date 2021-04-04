#alias 
new-alias rename rename-item #renomear arquivo
new-alias c clear-host #limpar tela
new-alias touch New-Item #criar arquivo

#get the path of the last directory accessed
$theLast = Get-Content 'C:\Users\55149\Documents\WindowsPowerShell\theLast.txt'

#customizing the prompt
function prompt {
  $p = Split-Path -leaf -path (Get-Location)
  "$p> "
}

#function for simulate command top from Linux
#Yeah...I know, but I think this pretty cool
function top{param([int]$intervalo, [int]$quantidade, [string]$ordenacao)
		
	
While(1) {Get-Process | Sort-Object -des $ordenacao| Select-Object -f $quantidade | Format-Table -a; Start-Sleep $intervalo; Clear-Host} 
}

#function for streamline the process for add, commit and push on git
function commit {
	$args = $args.split("/")
	git add $args[0]
	git commit -m $($args[1])
	git pull --rebase
	git push origin master
}

#open a file or web page with Firefox. It's usefull if you ara a web programer :)
function startFirefox {
	param (
		$page
	)
	Start-Process -FilePath 'C:\Program Files\Mozilla Firefox\firefox.exe' $page
}

#welcome mensage
write-host "Welcome aboard Captain, all system online!"

#open console commands history
function openHistory {
	code (Get-PSReadLineOption).HistorySavePath
}

#logs the event when exiting powershell 
Register-EngineEvent PowerShell.Exiting -Action {
	guardarUltimoDiretorio 
} > $null

#this funcition save the last directory accessed in notepad file
function guardarUltimoDiretorio {
	$arquivo = 'C:\Users\55149\Documents\WindowsPowerShell\theLast.txt'
	Set-Content $arquivo ''
	Set-Content $arquivo $pwd.Path
}

function addPoint {
	$args = $args.split("/")
	$path = 'C:\Users\55149\Documents\WindowsPowerShell\pontos.txt'
	$newPath ='$global:'+"$($args)"+" = '$PWD';"
	Add-Content -Path $path -value $newPath
	loadPoints

}

function loadPoints {
	$path = 'C:\Users\55149\Documents\WindowsPowerShell\pontos.txt'
	$points = Get-Content $path
	$points = [string]$points

	$sb = [scriptblock]::Create($points)
    Invoke-Command -scriptblock $sb

}

loadPoints
