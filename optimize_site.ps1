# 网站性能优化脚本

# 1. 压缩HTML文件
function Compress-HTML {
    param(
        [string]$filePath
    )
    
    $content = Get-Content -Path $filePath -Raw
    
    # 移除HTML注释
    $content = $content -replace '<!--[\s\S]*?-->', ''
    
    # 移除多余的空白字符
    $content = $content -replace '\s+', ' ' -replace '^\s+|\s+$', ''
    
    # 保持pre和code标签中的空白
    $content = $content -replace '(<pre[^>]*>)(.*?)(</pre>)', { 
        $matches[1] + $matches[2] + $matches[3] 
    } -replace '(<code[^>]*>)(.*?)(</code>)', { 
        $matches[1] + $matches[2] + $matches[3] 
    }
    
    # 输出压缩后的内容
    $content
}

# 2. 优化图片建议
function Show-ImageOptimizationTips {
    Write-Host "\n图片优化建议："
    Write-Host "1. 将wechat-qr.jpg压缩为webp格式"
    Write-Host "2. 考虑使用响应式图片技术"
    Write-Host "3. 为图片添加懒加载属性"
}

# 3. 输出优化后的HTML文件
function Optimize-Site {
    # 压缩HTML
    $originalSize = (Get-Item .\index.html).Length
    Write-Host "原始HTML文件大小: $originalSize 字节"
    
    $compressedContent = Compress-HTML -filePath .\index.html
    Set-Content -Path .\index-optimized.html -Value $compressedContent
    
    $compressedSize = (Get-Item .\index-optimized.html).Length
    Write-Host "压缩后HTML文件大小: $compressedSize 字节"
    
    $savings = $originalSize - $compressedSize
    $percentage = [math]::Round(($savings / $originalSize) * 100, 2)
    Write-Host "节省空间: $savings 字节 ($percentage`%)"
    
    # 显示图片优化建议
    Show-ImageOptimizationTips
    
    # 显示性能优化建议
    Write-Host "\n网站性能优化建议："
    Write-Host "1. 使用CDN加载第三方资源"
    Write-Host "2. 添加浏览器缓存控制头"
    Write-Host "3. 延迟加载非关键JavaScript"
    Write-Host "4. 内联关键CSS"
    Write-Host "5. 考虑启用GZIP或Brotli压缩"
}

# 执行优化
Optimize-Site

Write-Host "\n优化完成！生成的优化文件为: index-optimized.html"
Write-Host "您可以将其重命名为index.html以替换原文件。"