import os

def main():
    base_dir = r"c:\Users\inamu\OneDrive\Desktop\adsssss"
    index_path = os.path.join(base_dir, "index.html")
    with open(index_path, "r", encoding="utf-8") as f:
        content = f.read()

    # Split to get Header and Footer
    hero_split = content.index("<!-- HERO -->")
    header = content[:hero_split]

    footer_split = content.index("<!-- FOOTER -->")
    footer = content[footer_split:]
    
    # We want to replace the index page links with relative links to index.html if needed.
    # Currently nav links are href="#services", etc.
    # For sub-pages, we'll change href="#services" to href="index.html#services" etc.
    header = header.replace('href="#services"', 'href="index.html#services"')
    header = header.replace('href="#plans"', 'href="index.html#plans"')
    header = header.replace('href="#how"', 'href="index.html#how"')
    header = header.replace('href="#faq"', 'href="index.html#faq"')
    header = header.replace('href="#contact"', 'href="index.html#contact"')
    
    # Add some base css for the new pages
    custom_style = """
  <style>
    .page-hero {
      padding: 10rem 5% 4rem;
      background: var(--dark);
      text-align: center;
      position: relative;
    }
    .page-hero h1 {
      font-family: 'Bebas Neue', cursive;
      font-size: 4rem;
      color: var(--white);
      margin-bottom: 1rem;
    }
    .page-hero .red { color: var(--red); }
    .page-content {
      padding: 0 5% 5rem;
      max-width: 900px;
      margin: 0 auto;
      line-height: 1.8;
      color: #ccc;
    }
    .page-content h2 {
      font-family: 'Bebas Neue', cursive;
      font-size: 2rem;
      color: var(--white);
      margin-top: 2rem;
      margin-bottom: 1rem;
    }
    .page-content p {
      margin-bottom: 1rem;
    }
    .page-content ul {
      margin-left: 2rem;
      margin-bottom: 1.5rem;
    }
    .page-content li {
      margin-bottom: 0.5rem;
    }
  </style>
"""
    header = header.replace("</head>", custom_style + "\n</head>")

    pages = {
        "privacy.html": {
            "title": "Privacy <span class='red'>Policy</span>",
            "content": """
            <h2>1. Information We Collect</h2>
            <p>We collect information you provide directly to us when using VidFlow.in services, such as your name, email address, phone number, and YouTube channel links. We do not require or collect your password.</p>
            <h2>2. How We Use Your Information</h2>
            <p>Your information is used solely to process your orders, communicate regarding your campaigns, and provide customer support. We may send you transaction-related emails or WhatsApp updates.</p>
            <h2>3. Security</h2>
            <p>We use industry-standard security measures, including SSL encryption, to protect your personal and payment data during transaction processing. Your data is not sold to third parties.</p>
            <h2>4. Cookies</h2>
            <p>Our website uses necessary cookies to ensure proper functionality and improve user experience.</p>
            """
        },
        "terms.html": {
            "title": "Terms & <span class='red'>Conditions</span>",
            "content": """
            <h2>1. Agreement to Terms</h2>
            <p>By using the services of VidFlow.in, you agree to be bound by these Terms & Conditions. If you do not agree to these terms, please do not use our services.</p>
            <h2>2. Service Usage</h2>
            <p>Our services are provided "as is". You agree that VidFlow is not responsible for any changes in third-party platform algorithms (e.g., YouTube) that may impact the visibility or status of your content.</p>
            <h2>3. Payment</h2>
            <p>All payments must be completed before campaign activation. We use secure third-party payment gateways for processing.</p>
            <h2>4. Liability</h2>
            <p>VidFlow.in simply provides promotional services to increase views and subscribers. We do not guarantee specific monetary returns or sponsorships as a result of using our services.</p>
            """
        },
        "refund.html": {
            "title": "Refund <span class='red'>Policy</span>",
            "content": """
            <h2>1. Full Refunds</h2>
            <p>If we fail to deliver the promised services within the agreed timeline, you are eligible for a full refund. We pride ourselves on a 98% satisfaction rate.</p>
            <h2>2. Partial Refunds</h2>
            <p>If an order is partially completed and cannot be fulfilled due to unforeseen technical difficulties on the platform, a prorated refund will be issued.</p>
            <h2>3. Drop Protection</h2>
            <p>We offer up to 60-day drop protection. If any of the delivered metrics drop significantly within this period, we will refill them free of charge.</p>
            <h2>4. Requesting a Refund</h2>
            <p>To request a refund, please contact our support team via WhatsApp or email with your order details. Refunds are typically processed within 5-7 business days.</p>
            """
        },
        "thankyou.html": {
            "title": "Thank <span class='red'>You</span>",
            "content": """
            <p style="text-align: center; font-size: 1.2rem; margin-top: 2rem;">Your request has been successfully received!</p>
            <p style="text-align: center;">Our team will get in touch with you shortly on WhatsApp to process your request and start your growth journey.</p>
            <div style="text-align: center; margin-top: 3rem;">
              <a href="index.html" class="btn-primary" style="display: inline-block;">Return to Homepage</a>
            </div>
            """
        }
    }

    for filename, data in pages.items():
        page_html = header + f'''
  <section class="page-hero">
    <h1>{data["title"]}</h1>
  </section>
  <section class="page-content">
    {data["content"]}
  </section>
''' + footer
        
        with open(os.path.join(base_dir, filename), "w", encoding="utf-8") as f:
            f.write(page_html)
            
    print("Files created successfully.")

if __name__ == "__main__":
    main()
