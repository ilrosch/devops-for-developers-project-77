output "alb_ip" {
  value = yandex_alb_load_balancer.alb.listener[0].endpoint[0].address
}