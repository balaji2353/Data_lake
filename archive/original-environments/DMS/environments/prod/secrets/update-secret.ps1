Param(
  [Parameter(Mandatory=$true)] [string]$SecretName,
  [Parameter(Mandatory=$true)] [string]$Username,
  [Parameter(Mandatory=$true)] [string]$Password,
  [string]$Region = "ap-south-1",
  [switch]$WhatIf
)

# Build JSON payload
$payload = @{ username = $Username; password = $Password } | ConvertTo-Json -Compress

# Write to a temp file to avoid CLI quoting/escaping issues
$tempFile = [System.IO.Path]::Combine([System.IO.Path]::GetTempPath(), ([System.Guid]::NewGuid().ToString() + ".json"))
$payload | Out-File -FilePath $tempFile -Encoding utf8

if ($WhatIf) {
  Write-Host "WhatIf: would run aws secretsmanager put-secret-value --secret-id $SecretName --secret-string file://$tempFile --region $Region"
  Remove-Item $tempFile -ErrorAction SilentlyContinue
  exit 0
}

Write-Host "Updating Secrets Manager secret '$SecretName' in region $Region..."
& aws secretsmanager put-secret-value --secret-id $SecretName --secret-string ("file://" + $tempFile) --region $Region
$exit = $LASTEXITCODE
Remove-Item $tempFile -ErrorAction SilentlyContinue
if ($exit -ne 0) {
  Write-Error "AWS CLI returned exit code $exit. Secret not updated."
  exit $exit
}

Write-Host "Secret updated successfully."
