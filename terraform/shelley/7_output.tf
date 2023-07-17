output "service_ip" {
  value = "http://${kubernetes_service.this.status[0].load_balancer[0].ingress[0].ip}"
}
