# Basic HTML Compression Script

# Read original file
$content = Get-Content -Path .\index.html -Raw
$originalSize = $content.Length
Write-Host "Original size: $originalSize bytes"

# Remove comments and extra whitespace
$content = $content -replace '<!--[\s\S]*?-->', ''
$content = $content -replace '\s+', ' ' -replace '^\s+|\s+$', ''

# Save compressed file
Set-Content -Path .\index-compressed.html -Value $content -Encoding UTF8
$compressedSize = (Get-Item .\index-compressed.html).Length
Write-Host "Compressed size: $compressedSize bytes"

# Calculate savings
$savings = $originalSize - $compressedSize
$percentage = [math]::Round(($savings / $originalSize) * 100, 2)
Write-Host "Saved: $savings bytes ($percentage%)"

Write-Host ""
Write-Host "Compression complete! Output file: index-compressed.html"