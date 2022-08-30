if (dotnet tool list -g | Select-String "dbup-cli") {
	Write-Host "dbup-cli instalado";
}
else {
	dotnet tool install --global dbup-cli
}

dbup upgrade dbup.yml