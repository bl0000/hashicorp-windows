datacenter = "local"
data_dir   = "/etc/nomad.d"
log_file = "C:/nomad/log/nomad.log"

client {
  enabled = true
  servers = ["xxx.xxx.xxx.xxx"]
}

plugin "raw_exec" {
  config {
    enabled = true
  }
}