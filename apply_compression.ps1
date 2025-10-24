# Apply Compression to Production

Write-Host "Applying compression to index.html..."

# Read compressed content
$compressedContent = Get-Content -Path .\index-compressed.html -Raw

# Create backup
Copy-Item -Path .\index.html -Destination .\index.html.bak
Write-Host "Created backup: index.html.bak"

# Apply compressed content
Set-Content -Path .\index.html -Value $compressedContent -Encoding UTF8
Write-Host "Successfully updated index.html with compressed content"
Write-Host "Website should now load faster!"