$baseDir = "c:\Users\inamu\OneDrive\Desktop\adsssss"
$indexPath = Join-Path $baseDir "index.html"
$content = [System.IO.File]::ReadAllText($indexPath)

$heroSplit = $content.IndexOf("<!-- HERO -->")
$header = $content.Substring(0, $heroSplit)

$footerSplit = $content.IndexOf("<!-- FOOTER -->")
$footer = $content.Substring($footerSplit)

$header = $header.Replace('href="#services"', 'href="index.html#services"')
$header = $header.Replace('href="#plans"', 'href="index.html#plans"')
$header = $header.Replace('href="#how"', 'href="index.html#how"')
$header = $header.Replace('href="#faq"', 'href="index.html#faq"')
$header = $header.Replace('href="#contact"', 'href="index.html#contact"')

$customStyle = @"
  <style>
    .page-hero { padding: 10rem 5% 4rem; background: var(--dark); text-align: center; position: relative; }
    .page-hero h1 { font-family: 'Bebas Neue', cursive; font-size: 4rem; color: var(--white); margin-bottom: 1rem; }
    .page-hero .red { color: var(--red); }
    .page-content { padding: 0 5% 5rem; max-width: 900px; margin: 0 auto; line-height: 1.8; color: #ccc; }
    .page-content h2 { font-family: 'Bebas Neue', cursive; font-size: 2rem; color: var(--white); margin-top: 2rem; margin-bottom: 1rem; }
    .page-content p { margin-bottom: 1rem; }
    .page-content ul { margin-left: 2rem; margin-bottom: 1.5rem; }
    .page-content li { margin-bottom: 0.5rem; }
  </style>
</head>
"@
$header = $header.Replace("</head>", $customStyle)

$pages = [ordered]@{
    "privacy.html" = @{
        title = "Privacy <span class='red'>Policy</span>"
        content = "<h2>1. Information We Collect</h2><p>We collect information you provide directly to us when using VidFlow.in services, such as your name, email address, phone number, and YouTube channel links. We do not require or collect your password.</p><h2>2. How We Use Your Information</h2><p>Your information is used solely to process your orders, communicate regarding your campaigns, and provide customer support. We may send you transaction-related emails or WhatsApp updates.</p><h2>3. Security</h2><p>We use industry-standard security measures, including SSL encryption, to protect your personal and payment data during transaction processing. Your data is not sold to third parties.</p><h2>4. Cookies</h2><p>Our website uses necessary cookies to ensure proper functionality and improve user experience.</p>"
    }
    "terms.html" = @{
        title = "Terms & <span class='red'>Conditions</span>"
        content = "<h2>1. Agreement to Terms</h2><p>By using the services of VidFlow.in, you agree to be bound by these Terms & Conditions. If you do not agree to these terms, please do not use our services.</p><h2>2. Service Usage</h2><p>Our services are provided `"as is`". You agree that VidFlow is not responsible for any changes in third-party platform algorithms (e.g., YouTube) that may impact the visibility or status of your content.</p><h2>3. Payment</h2><p>All payments must be completed before campaign activation. We use secure third-party payment gateways for processing.</p><h2>4. Liability</h2><p>VidFlow.in simply provides promotional services to increase views and subscribers. We do not guarantee specific monetary returns or sponsorships as a result of using our services.</p>"
    }
    "refund.html" = @{
        title = "Refund <span class='red'>Policy</span>"
        content = @"
<p>At Vidflow.in, we provide digital YouTube video promotion services that involve immediate resource allocation, advertising costs, and third-party platform usage. By placing an order with Vidflow.in, you acknowledge and agree to the refund terms stated below.</p><h2>1. General No-Refund Policy</h2><p>All services offered by Vidflow.in are non-refundable once an order has been placed and confirmed.</p><p>Due to the nature of digital marketing services, advertising costs and campaign setup expenses are incurred immediately after order confirmation. Therefore, customers should carefully review their order details before making payment, as refunds will not be provided for change of mind, dissatisfaction, or campaign performance expectations.</p><p>By purchasing any service from Vidflow.in, you agree that refunds are not guaranteed under any circumstances except those explicitly mentioned below.</p><h2>2. Limited Exceptions (If Applicable)</h2><p>Refunds may be considered only at the sole discretion of Vidflow.in under the following rare situations:</p><ul><li>A duplicate payment has been successfully charged for the same order.</li><li>The service was not initiated within 72 hours due to a confirmed technical fault from our side.</li></ul><p>Even in the above situations, Vidflow.in reserves the full right to approve or decline refund requests after reviewing the case.</p><h2>3. Strictly Non-Refundable Situations</h2><p>Refunds will not be issued under any of the following circumstances:</p><ul><li>Once a campaign, promotion, or advertisement process has been initiated.</li><li>If the client provides incorrect, invalid, or restricted video/channel links.</li><li>If the content violates YouTube policies, community guidelines, or copyright rules.</li><li>If the client requests cancellation after the order has been placed.</li><li>If expected results such as views, engagement, or performance vary due to platform algorithms or market conditions.</li><li>If delays or changes occur due to third-party platforms such as YouTube or advertising networks.</li><li>If the client is dissatisfied with performance despite services being delivered as agreed.</li></ul><h2>4. No Guarantee of Refund</h2><p>Vidflow.in does not guarantee refunds under any situation. Any approved refund, if granted, will be processed only as a goodwill gesture and should not be considered a standard practice or obligation.</p><h2>5. Refund Processing (If Approved)</h2><p>If a refund is exceptionally approved:</p><ul><li>It will be processed within 7–10 business days.</li><li>The refund will be issued via the original payment method, where applicable.</li><li>Processing time may vary depending on banks or payment providers.</li></ul><h2>6. Acceptance of Policy</h2><p>By purchasing services from Vidflow.in, you confirm that:</p><ul><li>You have read and understood this Refund Policy.</li><li>You agree that services are generally non-refundable.</li><li>You will not initiate refund claims, disputes, or chargebacks without first contacting our support team.</li></ul><h2>7. Contact for Billing or Refund Queries</h2><p>For billing-related queries, please contact:</p><ul><li>Email: support@vidflow.in</li><li>Website: <a href=`"http://www.vidflow.in`" style=`"color:var(--red);`">www.vidflow.in</a></li></ul><p>Include:</p><ul><li>Order ID</li><li>Registered Email Address</li><li>Description of the issue</li></ul><p>Our team will review your request at its discretion.</p>
"@
    }
    "thankyou.html" = @{
        title = "Thank <span class='red'>You</span>"
        content = "<p style='text-align: center; font-size: 1.2rem; margin-top: 2rem;'>Your request has been successfully received!</p><p style='text-align: center;'>Our team will get in touch with you shortly on WhatsApp to process your request and start your growth journey.</p><div style='text-align: center; margin-top: 3rem;'><a href='index.html' class='btn-primary' style='display: inline-block; text-decoration: none;'>Return to Homepage</a></div>"
    }
}

foreach ($key in $pages.Keys) {
    $page = $pages[$key]
    $html = $header + "<section class='page-hero'><h1>" + $page.title + "</h1></section><section class='page-content'>" + $page.content + "</section>" + $footer
    $outPath = Join-Path $baseDir $key
    [System.IO.File]::WriteAllText($outPath, $html)
}
Write-Host "Pages generated successfully."
