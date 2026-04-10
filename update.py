import os

base_dir = r"c:\Users\inamu\OneDrive\Desktop\adsssss"
index_path = os.path.join(base_dir, "index.html")

with open(index_path, "r", encoding="utf-8") as f:
    html = f.read()

replacements = [
    # A. Refund Policy in Navbar
    (
        '<a href="#how">How It Works</a>\n      <a href="#faq">FAQ</a>',
        '<a href="#how">How It Works</a>\n      <a href="refund.html">Refund Policy</a>\n      <a href="#faq">FAQ</a>'
    ),
    (
        '<a href="#how" onclick="toggleMenu()">How It Works</a>\n    <a href="#faq" onclick="toggleMenu()">FAQ</a>',
        '<a href="#how" onclick="toggleMenu()">How It Works</a>\n    <a href="refund.html" onclick="toggleMenu()">Refund Policy</a>\n    <a href="#faq" onclick="toggleMenu()">FAQ</a>'
    ),
    
    # B. Add Google Ads design snippet below hero
    (
        '  <!-- TICKER -->',
        '''  <!-- GOOGLE ADS BANNER -->
  <div style="background: rgba(255, 0, 0, 0.05); padding: 1.5rem 5%; text-align: center; border-top: 1px solid rgba(255,0,0,0.1); border-bottom: 1px solid rgba(255,0,0,0.1); border-top: 1px solid rgba(255, 255, 255, 0.05); display: flex; align-items: center; justify-content: center; gap: 15px; flex-wrap: wrap;">
     <div style="width: 45px; height: 45px; background: rgba(255,0,0,0.15); border-radius: 50%; display: flex; align-items: center; justify-content: center; color: var(--red); font-size: 1.3rem;">✦</div>
     <div style="color: #ccc; font-size: 0.95rem; text-align: left; line-height: 1.5; max-width: 600px;">
       <strong style="color: var(--white); font-weight: 600; font-size: 1.05rem;">We Are Working For You:</strong><br/>
       We exclusively use <span style="color: var(--gold); font-weight: 600;">Google Ads</span> to get your views and watchtime. 100% genuine traffic. No bots.
     </div>
  </div>
  
  <!-- TICKER -->'''
    ),

    # C. "in get started for free button there will be pop up form"
    (
        '<a href="#how" class="btn-secondary">How Does It Work?</a>',
        '<button onclick="openOrderForm(\'Free Trial\', \'₹0\')" class="btn-secondary">Get Started For Free</button>'
    ),

    # D. Remove Blog and Case Studies from footer
    (
        '<a href="#">About Us</a>\n        <a href="#">Blog</a>\n        <a href="#">Case Studies</a>\n        <a href="#">Contact</a>',
        '<a href="#contact">About Us</a>\n        <a href="#contact">Contact</a>'
    ),

    # F. Footer Links
    (
        '<a href="#">WhatsApp Support</a>\n        <a href="#">Refund Policy</a>\n        <a href="#">Privacy Policy</a>\n        <a href="#">Terms of Service</a>',
        '<a href="https://wa.me/919876543210" target="_blank">WhatsApp Support</a>\n        <a href="refund.html">Refund Policy</a>\n        <a href="privacy.html">Privacy Policy</a>\n        <a href="terms.html">Terms of Service</a>'
    ),
    (
        '<a href="#">Privacy</a>\n        <a href="#">Terms</a>\n        <a href="#">Refunds</a>',
        '<a href="privacy.html">Privacy</a>\n        <a href="terms.html">Terms</a>\n        <a href="refund.html">Refunds</a>'
    ),
]

# E. CTA Section (replace the whole section)
cta_old = '''  <!-- CTA -->
  <section class="cta-section">
    <h2>Your Channel Won't<br /><span style="color:var(--red);">Grow Itself.</span></h2>
    <p>Drop your YouTube link below and we'll reach out within 1 hour.</p>
    <div class="cta-form">
      <input class="cta-input" type="text" placeholder="youtube.com/@yourchannel" id="ytLink" />
      <button class="btn-primary" style="white-space:nowrap;" onclick="ctaSubmit()">Get Free Analysis</button>
    </div>
    <p style="font-size:0.75rem;color:#555;margin-top:1rem;">No spam. One WhatsApp message — guaranteed.</p>
  </section>'''

cta_new = '''  <!-- CTA -->
  <section class="cta-section">
    <h2>Your Channel Won't<br /><span style="color:var(--red);">Grow Itself.</span></h2>
    <p>Drop your YouTube link and mobile number below to start growing.</p>
    <form class="cta-form" onsubmit="event.preventDefault(); window.location.href='thankyou.html';">
      <input class="cta-input" type="url" placeholder="youtube.com/@yourchannel" required style="min-width: 200px; flex: 1;" />
      <input class="cta-input" type="tel" placeholder="Mobile Number" required style="min-width: 150px; flex: 1;" />
      <button type="submit" class="btn-primary" style="white-space:nowrap;">Get Started For Free</button>
    </form>
    <p style="font-size:0.75rem;color:#555;margin-top:1rem;">No spam. One WhatsApp message — guaranteed.</p>
  </section>'''

replacements.append((cta_old, cta_new))

# E JS Update (Go to thankyou page on submit for the popups)
js_old_order = '''      setTimeout(() => {
        alert('✅ Order Received!\\n\\nThank you, ' + name + '!\\nOur team will contact you on WhatsApp (' + phone + ') within 1 hour to confirm your order and process payment.\\n\\n(Developer: Connect this to your backend / WhatsApp API here)');
      }, 200);'''
js_new_order = '''      setTimeout(() => {
        window.location.href = 'thankyou.html';
      }, 200);'''
replacements.append((js_old_order, js_new_order))

js_old_pay = '''      setTimeout(() => {
        alert('🎉 Payment Initiated!\\n\\nPlan: ' + plan + '\\nAmount: ' + amount + '\\n\\n(Developer: Integrate Razorpay SDK here:\\nconst rzp = new Razorpay({key:"YOUR_KEY", amount:..., ...}); rzp.open();)');
      }, 200);'''
js_new_pay = '''      setTimeout(() => {
        window.location.href = 'thankyou.html';
      }, 200);'''
replacements.append((js_old_pay, js_new_pay))

js_old_contact = '''      alert('✅ Message Sent!\\n\\nThanks ' + name + '! We\\'ll reach out to you at ' + phone + ' within 1 hour.\\n\\n(Developer: Connect to EmailJS / backend API here)');'''
js_new_contact = '''      window.location.href = 'thankyou.html';'''
replacements.append((js_old_contact, js_new_contact))

# Emojis replacements C
emoji_map = {
    '👁️': '<span style="color:var(--red);">✦</span>',
    '🔔': '<span style="color:var(--gold);">▲</span>',
    '❤️': '<span style="color:var(--red);">❤</span>',
    '🔗': '<span style="color:#aaa;">⯈</span>',
    '🔥': '<span style="color:var(--red);">✦</span>',
    '📈': '<span style="color:var(--gold);">▲</span>',
    '⚡': '<span style="color:var(--green);">►</span>',
    '🇮🇳': '<span style="color:var(--red);">✦</span>',
    '💬': '<span style="color:#aaa;">✉</span>',
    '✅': '<span style="color:var(--green);">✓</span>',
    '🔒': '<span style="color:var(--gold);">◈</span>',
    '⭐': '<span style="color:var(--gold);">★</span>',
    '🏆': '<span style="color:var(--gold);">★</span>',
    '🛡️': '<span style="color:var(--red);">✦</span>',
    '📸': '<span style="color:#ccc;">[IG]</span>',
    '✈️': '<span style="color:#ccc;">[TG]</span>',
    '▶️': '<span style="color:#ccc;">[YT]</span>',
    '⚙️': '⚙',
    '🚀': '<span style="color:var(--red);">✦</span>',
    '📍': '•',
    '📧': '✉',
    '⏰': '○'
}

for old, new in replacements:
    if old in html:
        html = html.replace(old, new)
    else:
        print(f"Warning: Could not find block:\n{old[:50]}...")

for emoji, styled in emoji_map.items():
    html = html.replace(emoji, styled)

with open(index_path, "w", encoding="utf-8") as f:
    f.write(html)

print("Update complete")
