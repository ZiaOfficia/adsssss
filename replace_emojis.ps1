$ErrorActionPreference = "Stop"
$path = "c:\Users\inamu\OneDrive\Desktop\adsssss\index.html"
$content = [System.IO.File]::ReadAllText($path, [System.Text.Encoding]::UTF8)

$content = $content.Replace('👁️', '<span style="color:var(--red);">✦</span>')
$content = $content.Replace('🔔', '<span style="color:var(--gold);">▲</span>')
$content = $content.Replace('❤️', '<span style="color:var(--red);">❤</span>')
$content = $content.Replace('🔗', '<span style="color:#aaa;">⯈</span>')
$content = $content.Replace('🔥', '<span style="color:var(--red);">✦</span>')
$content = $content.Replace('📈', '<span style="color:var(--gold);">▲</span>')
$content = $content.Replace('⚡', '<span style="color:var(--green);">►</span>')
$content = $content.Replace('🇮🇳', '<span style="color:var(--red);">✦</span>')
$content = $content.Replace('💬', '<span style="color:#aaa;">✉</span>')
$content = $content.Replace('✅', '<span style="color:var(--green);">✓</span>')
$content = $content.Replace('🔒', '<span style="color:var(--gold);">◈</span>')
$content = $content.Replace('⭐', '<span style="color:var(--gold);">★</span>')
$content = $content.Replace('🏆', '<span style="color:var(--gold);">★</span>')
$content = $content.Replace('🛡️', '<span style="color:var(--red);">✦</span>')
$content = $content.Replace('📸', '<span style="color:#ccc;">IG</span>')
$content = $content.Replace('✈️', '<span style="color:#ccc;">TG</span>')
$content = $content.Replace('▶️', '<span style="color:#ccc;">YT</span>')
$content = $content.Replace('⚙️', '⚙')
$content = $content.Replace('🚀', '<span style="color:var(--red);">✦</span>')
$content = $content.Replace('📍', '•')
$content = $content.Replace('📧', '✉')
$content = $content.Replace('⏰', '○')

[System.IO.File]::WriteAllText($path, $content, [System.Text.Encoding]::UTF8)
Write-Host "Emojis Replaced successfully."
