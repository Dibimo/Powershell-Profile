#deixando só o diretorio atual
#customizando a função prompt
function prompt {
  $p = Split-Path -leaf -path (Get-Location)
  "$p> "
}

#Função top do Linux :p
function top{param([int]$intervalo, [int]$quantidade, [string]$ordenacao)
		
	
While(1) {ps | sort -des $ordenacao| select -f $quantidade | ft -a; sleep $intervalo; cls} 
}

#Função para copiar a estrutura de um commit
function commit {
	param(
		[string]$mensagem,
		[string]$arquivo
	)
	git add $arquivo
	git commit -m $mensagem
	git push origin master
}

#abrir com o firefox
function startFirefox {
	param (
		$page
	)
	Start-Process -FilePath 'C:\Program Files\Mozilla Firefox\firefox.exe' $page
}

#definição de apelidos personalizados para comandos
new-alias rename rename-item #renomear arquivo
new-alias c clear-host #limpar tela
new-alias touch New-Item #criar arquivo
new-alias shotdown Stop-Computer #desligar o pc



#mensagem de bem vindo
write-host "Welcome aboard Captain, all system online!"

#adicionando biblioteca que contem o file dialog
#Add-Type -AssemblyName System.Windows.Forms

#abrir histórico do console
function openHistory {
	code (Get-PSReadLineOption).HistorySavePath
}
