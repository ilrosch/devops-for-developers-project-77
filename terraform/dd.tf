# resource "datadog_monitor" "" {
#   name              = ""
#   type              = "service check"
#   query             = ""
#   message           = ""
#   no_data_timeframe = 10
#   notify_no_data    = true

#   notify_audit = false
#   timeout_h    = 0
#   include_tags = true

# }

resource "datadog_monitor" "http_checker" {
  name    = "HTTP check for host {{host.name}}"
  type    = "query alert"
  query   = <<EOT
avg(last_5m):min:http.can_connect{*} by {host} > 0
EOT
  message = <<EOT
HTTP Check failed: host is not reachable or returning non-2xx status.
EOT

  no_data_timeframe   = 10
  notify_no_data      = true
  draft_status        = "published"
  include_tags        = true
  require_full_window = false
}