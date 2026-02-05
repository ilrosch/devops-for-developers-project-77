resource "yandex_cm_certificate" "cm" {
  name    = "hexlet-cm"
  domains = [var.domain]
  managed {
    challenge_type = "DNS_CNAME"
  }
}

resource "time_sleep" "wait_for_cert_validation" {
  depends_on      = [yandex_cm_certificate.cm]
  create_duration = "8m"
}