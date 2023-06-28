resource "sysdig_monitor_alert_v2_prometheus" "test_alert" {
    name = "container restarts"
    group = "team01"
    description = "scrape job uptime"
    severity = "high"
    query = "rate(kube_pod_container_status_restarts_total{kube_cluster_name=\"prod\"}[5m])>0"
    trigger_after_minutes = 10
}

resource "sysdig_monitor_alert_v2_prometheus" "missing_group" {
    name = "probe up"
    description = "scrape job uptime"
    severity = "medium"
    query = "min(up) < 1"
    trigger_after_minutes = 10
}