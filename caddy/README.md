# Caddy

This is the reverse proxy which serves everything else. The caddyfiles are mentioned in the individual container folders, if I felt like they were worth mentioning because of a special configuration or something.

## Header shortcuts

I use two header shortcuts in all my configurations:

- `header1`, which is for a global header configuration
- `header2`, which configures a few more things inside the service

They are named differently sometimes, but you will hopefully get the idea

```
(header1) {
    header_down -Strict-Transport-Security
    header_down -X-XSS-Protection
    header_down -X-Robots-Tag
    header_down -X-Download-Options
    header_down -X-Permitted-Cross-Domain-Policies
    header_down -X-Content-Type-Options
    header_down -X-Frame-Options
    header_down -Referrer-Policy
    header_down -X-Powered-By
    header_down -Server 
}

(header2) {
    # Enable HTTP Strict Transport Security (HSTS) to force clients to always
    # connect via HTTPS (do not use if only testing) for 1 year
    Strict-Transport-Security "max-age=31536000; includeSubdomains; preload"
    # Expect-CT set to 24 hours
    Expect-CT "enforce, max-age=86400"
    # Enable cross-site filter (XSS) and tell browser to block detected attacks
    X-XSS-Protection "1; mode=block"
    # Prevent some browsers from MIME-sniffing a response away from the declared Content-Type
    # X-Content-Type-Options "nosniff"
    # Disallow the site to be rendered within a frame (clickjacking protection)
    X-Frame-Options "SAMEORIGIN"
    # Remove Server Header
    Server ""
    X-Robots-Tag "noindex,nofollow"
    X-Download-Options "noopen"
    X-Permitted-Cross-Domain-Policies "none"
    Referrer-Policy "strict-origin-when-cross-origin"
    Permissions-Policy "accelerometer=(), autoplay=(self), camera=(self), encrypted-media=(self), fullscreen=(self), geolocation=(self), gyroscope=(), magnetometer=(), microphone=(self), display-capture=(self), midi=(), payment=(), picture-in-picture=*, sync-xhr=(), usb=(), interest-cohort=()" 
}

```