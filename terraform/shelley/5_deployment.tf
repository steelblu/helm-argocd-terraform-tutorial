resource "kubernetes_deployment" "this" {
  metadata {
    name      = "nginx-deployment"
    namespace = kubernetes_namespace.this.metadata[0].name
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        app = var.label
      }
    }
    template {
      metadata {
        labels = {
          app = var.label
        }
      }
      spec {
        container {
          image = "nginx"
          name = "nginx"
          port {
            container_port = 80
          }
          volume_mount {
            mount_path = "/usr/share/nginx/html"
            name = "html"
          }
        }
        volume {
          name = "html"
          config_map {
            name = "nginx-html"
          }
        }
      }
    }
  }
}