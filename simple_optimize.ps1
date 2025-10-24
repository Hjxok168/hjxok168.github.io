# 简单网站优化脚本

# 1. 基本HTML压缩函数
function Compress-HTML {
    param([string]$filePath)
    
    # 读取文件内容
    $content = Get-Content -Path $filePath -Raw
    
    # 移除HTML注释
    $content = $content -replace '<!--[\s\S]*?-->', ''
    
    # 移除多余的空白字符
    $content = $content -replace '\s+', ' ' -replace '^\s+|\s+$', ''
    
    return $content
}

# 执行压缩
Write-Host "开始压缩HTML文件..."
$originalSize = (Get-Item .\index.html).Length
Write-Host "原始大小: $originalSize 字节"

$compressedContent = Compress-HTML -filePath .\index.html
Set-Content -Path .\index-compressed.html -Value $compressedContent -Encoding UTF8

$compressedSize = (Get-Item .\index-compressed.html).Length
Write-Host "压缩后大小: $compressedSize 字节"

$savings = $originalSize - $compressedSize
$percentage = [math]::Round(($savings / $originalSize) * 100, 2)
Write-Host "节省: $savings 字节 ("$percentage"%)"

# 图片优化建议
Write-Host ""
Write-Host "图片优化建议:"
Write-Host "1. 压缩wechat-qr.jpg图片"
Write-Host "2. 考虑转换为webp格式"
Write-Host "3. 添加lazy loading属性"

# 网站优化建议
Write-Host ""
Write-Host "网站优化建议:"
Write-Host "1. 使用CDN加载资源"
Write-Host "2. 优化CSS和JS"
Write-Host "3. 启用缓存"
Write-Host "4. 压缩文件传输"
Write-Host ""
Write-Host "优化完成! 输出文件: index-compressed.html"