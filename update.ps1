$ErrorActionPreference = "Stop"
$path = "c:\Users\inamu\OneDrive\Desktop\adsssss\index.html"
$content = [System.IO.File]::ReadAllText($path, [System.Text.Encoding]::UTF8)

# A. Refund Policy in Navbar
$content = $content.Replace(
    '<a href="#how">How It Works</a>`r`n      <a href="#faq">FAQ</a>',
    '<a href="#how">How It Works</a>`r`n      <a href="refund.html">Refund Policy</a>`r`n      <a href="#faq">FAQ</a>'
)

$content = $content.Replace(
    '<a href="#how">How It Works</a>`n      <a href="#faq">FAQ</a>',
    '<a href="#how">How It Works</a>`n      <a href="refund.html">Refund Policy</a>`n      <a href="#faq">FAQ</a>'
)

$content = $content.Replace(
    '<a href="#how" onclick="toggleMenu()">How It Works</a>`n    <a href="#faq" onclick="toggleMenu()">FAQ</a>',
    '<a href="#how" onclick="toggleMenu()">How It Works</a>`n    <a href="refund.html" onclick="toggleMenu()">Refund Policy</a>`n    <a href="#faq" onclick="toggleMenu()">FAQ</a>'
)

$content = $content.Replace(
    '<a href="#how" onclick="toggleMenu()">How It Works</a>`r`n    <a href="#faq" onclick="toggleMenu()">FAQ</a>',
    '<a href="#how" onclick="toggleMenu()">How It Works</a>`r`n    <a href="refund.html" onclick="toggleMenu()">Refund Policy</a>`r`n    <a href="#faq" onclick="toggleMenu()">FAQ</a>'
)

# B. Google Ads Design Banner
$banner = @"
  <!-- GOOGLE ADS BANNER -->
  <div style="background: rgba(255, 0, 0, 0.05); padding: 1.5rem 5%; text-align: center; border-bottom: 1px solid rgba(255,0,0,0.1); border-top: 1px solid rgba(255, 255, 255, 0.05); display: flex; align-items: center; justify-content: center; gap: 15px; flex-wrap: wrap;">
     <div style="width: 45px; height: 45px; background: rgba(255,0,0,0.15); border-radius: 50%; display: flex; align-items: center; justify-content: center; color: var(--red); font-size: 1.3rem;">✦</div>
     <div style="color: #ccc; font-size: 0.95rem; text-align: left; line-height: 1.5; max-width: 600px;">
       <strong style="color: var(--white); font-weight: 600; font-size: 1.05rem;">We Are Working For You:</strong><br/>
       We exclusively use <span style="color: var(--gold); font-weight: 600;">Google Ads</span> to get your views and watchtime. 100% genuine traffic. No bots.
     </div>
  </div>
  
  <!-- TICKER -->
"@
$content = $content.Replace('  <!-- TICKER -->', $banner)

# C. Get Started For Free button in hero
$content = $content.Replace(
    '<a href="#how" class="btn-secondary">How Does It Work?</a>',
    '<button onclick="openOrderForm(''Free Trial'', ''₹0'')" class="btn-secondary">Get Started For Free</button>'
)

# D. Remove Blog and Case Studies from footer
$content = $content.Replace(
    '<a href="#">About Us</a>`r`n        <a href="#">Blog</a>`r`n        <a href="#">Case Studies</a>`r`n        <a href="#">Contact</a>',
    '<a href="#contact">About Us</a>`r`n        <a href="#contact">Contact</a>'
)
$content = $content.Replace(
    '<a href="#">About Us</a>`n        <a href="#">Blog</a>`n        <a href="#">Case Studies</a>`n        <a href="#">Contact</a>',
    '<a href="#contact">About Us</a>`n        <a href="#contact">Contact</a>'
)

# F. Footer Links
$content = $content.Replace(
    '<a href="#">WhatsApp Support</a>`n        <a href="#">Refund Policy</a>`n        <a href="#">Privacy Policy</a>`n        <a href="#">Terms of Service</a>',
    '<a href="https://wa.me/919876543210" target="_blank">WhatsApp Support</a>`n        <a href="refund.html">Refund Policy</a>`n        <a href="privacy.html">Privacy Policy</a>`n        <a href="terms.html">Terms of Service</a>'
)
$content = $content.Replace(
    '<a href="#">Privacy</a>`n        <a href="#">Terms</a>`n        <a href="#">Refunds</a>',
    '<a href="privacy.html">Privacy</a>`n        <a href="terms.html">Terms</a>`n        <a href="refund.html">Refunds</a>'
)
$content = $content.Replace(
    '<a href="#">WhatsApp Support</a>`r`n        <a href="#">Refund Policy</a>`r`n        <a href="#">Privacy Policy</a>`r`n        <a href="#">Terms of Service</a>',
    '<a href="https://wa.me/919876543210" target="_blank">WhatsApp Support</a>`r`n        <a href="refund.html">Refund Policy</a>`r`n        <a href="privacy.html">Privacy Policy</a>`r`n        <a href="terms.html">Terms of Service</a>'
)
$content = $content.Replace(
    '<a href="#">Privacy</a>`r`n        <a href="#">Terms</a>`r`n        <a href="#">Refunds</a>',
    '<a href="privacy.html">Privacy</a>`r`n        <a href="terms.html">Terms</a>`r`n        <a href="refund.html">Refunds</a>'
)

# E. CTA Form replace (Need Regex because of whitespace variations)
$ctaOldPattern = "(?s)<!-- CTA -->.*?</section>"
$ctaNew = @"
  <!-- CTA -->
  <section class="cta-section">
    <h2>Your Channel Won't<br /><span style="color:var(--red);">Grow Itself.</span></h2>
    <p>Drop your YouTube link and mobile number below to start growing.</p>
    <form class="cta-form" onsubmit="event.preventDefault(); window.location.href='thankyou.html';">
      <input class="cta-input" type="url" placeholder="youtube.com/@yourchannel" required style="min-width: 200px; flex: 1;" />
      <input class="cta-input" type="tel" placeholder="Mobile Number" required style="min-width: 150px; flex: 1;" />
      <button type="submit" class="btn-primary" style="white-space:nowrap;">Get Started For Free</button>
    </form>
    <p style="font-size:0.75rem;color:#555;margin-top:1rem;">No spam. One WhatsApp message — guaranteed.</p>
  </section>
"@
$content = [System.Text.RegularExpressions.Regex]::Replace($content, $ctaOldPattern, $ctaNew)


# JS updates
$content = $content.Replace(
    "alert('✅ Order Received!\n\nThank you, ' + name + '!\nOur team will contact you on WhatsApp (' + phone + ') within 1 hour to confirm your order and process payment.\n\n(Developer: Connect this to your backend / WhatsApp API here)');",
    "window.location.href = 'thankyou.html';"
)
$content = $content.Replace(
    "alert('🎉 Payment Initiated!\n\nPlan: ' + plan + '\nAmount: ' + amount + '\n\n(Developer: Integrate Razorpay SDK here:\nconst rzp = new Razorpay({key:`"YOUR_KEY`", amount:..., ...}); rzp.open();)');",
    "window.location.href = 'thankyou.html';"
)
$content = $content.Replace(
    "alert('✅ Message Sent!\n\nThanks ' + name + '! We\'ll reach out to you at ' + phone + ' within 1 hour.\n\n(Developer: Connect to EmailJS / backend API here)');",
    "window.location.href = 'thankyou.html';"
)

$content = $content.Replace(
    "alert('✅ Order Received!`r`n`r`nThank you, ' + name + '!`r`nOur team will contact you on WhatsApp (' + phone + ') within 1 hour to confirm your order and process payment.`r`n`r`n(Developer: Connect this to your backend / WhatsApp API here)');",
    "window.location.href = 'thankyou.html';"
)
$content = $content.Replace(
    "alert('🎉 Payment Initiated!`r`n`r`nPlan: ' + plan + '`r`nAmount: ' + amount + '`r`n`r`n(Developer: Integrate Razorpay SDK here:`r`nconst rzp = new Razorpay({key:`"YOUR_KEY`", amount:..., ...}); rzp.open();)');",
    "window.location.href = 'thankyou.html';"
)
$content = $content.Replace(
    "alert('✅ Message Sent!`r`n`r`nThanks ' + name + '! We\'ll reach out to you at ' + phone + ' within 1 hour.`r`n`r`n(Developer: Connect to EmailJS / backend API here)');",
    "window.location.href = 'thankyou.html';"
)


# Emojis replace
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
$content = $content.Replace('📸', '<span style="color:#ccc;">[IG]</span>')
$content = $content.Replace('✈️', '<span style="color:#ccc;">[TG]</span>')
$content = $content.Replace('▶️', '<span style="color:#ccc;">[YT]</span>')
$content = $content.Replace('⚙️', '⚙')
$content = $content.Replace('🚀', '<span style="color:var(--red);">✦</span>')
$content = $content.Replace('📍', '•')
$content = $content.Replace('📧', '✉')
$content = $content.Replace('⏰', '○')

[System.IO.File]::WriteAllText($path, $content, [System.Text.Encoding]::UTF8)
Write-Host "Replaced successfully."
