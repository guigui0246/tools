taskkill /IM poptracker.exe /F | Out-Null
$source = $PSScriptRoot
$stagingRoot = Join-Path $env:TEMP ("albw-ap-poptracker-build-" + [guid]::NewGuid().ToString())
$staging = Join-Path $stagingRoot (Split-Path -Leaf $source)

New-Item -ItemType Directory -Path $staging -Force | Out-Null
robocopy $source $staging /E /XD .git .github .vscode __pycache__ .claude lua_definition /XF .gitignore build.ps1 make_hash.py *.kra archive.py .luarc.json | Out-Null

if ($LASTEXITCODE -ge 8) {
	throw "Failed to stage pack contents."
}

py .\archive.py -Path $staging -DestinationPath C:\Users\guigui0246-EPITECH\Downloads\poptracker\packs\albw-ap-poptracker.zip -Force
Remove-Item $stagingRoot -Recurse -Force
Start C:\Users\guigui0246-EPITECH\Downloads\poptracker\poptracker.exe | Out-Null

py .\make_hash.py
