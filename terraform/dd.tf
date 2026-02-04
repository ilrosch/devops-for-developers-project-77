resource "datadog_monitor" "http_checker" {
  no_data_timeframe = 10
  notify_no_data    = true
  name              = "HTTP check"
  type              = "service check"
  query             = <<EOT
"http.can_connect".over("*").by("host").last(2).count_by_status()
EOT
  message           = <<EOT
HTTP Check failed
EOT
}