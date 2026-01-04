output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.main.id
}

output "k8s_master_public_ip" {
  description = "Kubernetes Master Public IP"
  value       = aws_instance.k8s_master.public_ip
}

output "k8s_master_private_ip" {
  description = "Kubernetes Master Private IP"
  value       = aws_instance.k8s_master.private_ip
}

output "k8s_worker_public_ip" {
  description = "Kubernetes Worker Public IP"
  value       = aws_instance.k8s_worker.public_ip
}

output "k8s_worker_private_ip" {
  description = "Kubernetes Worker Private IP"
  value       = aws_instance.k8s_worker.private_ip
}

output "s3_bucket_name" {
  description = "S3 Bucket Name"
  value       = aws_s3_bucket.app_storage.id
}

output "ssh_commands" {
  description = "SSH commands to connect to instances"
  value       = <<-EOT
    
    ═══════════════════════════════════════════════════════════════
    SSH CONNECTION COMMANDS:
    ═══════════════════════════════════════════════════════════════
    
    Master Node:
    ssh -i ~/.ssh/${var.key_name} ubuntu@${aws_instance.k8s_master.public_ip}
    
    Worker Node:
    ssh -i ~/.ssh/${var.key_name} ubuntu@${aws_instance.k8s_worker.public_ip}
    
    ═══════════════════════════════════════════════════════════════
  EOT
}

output "free_tier_summary" {
  description = "FREE TIER Usage Summary"
  value       = <<-EOT
    
    ═══════════════════════════════════════════════════════════════
    ✅ AWS FREE TIER USAGE SUMMARY
    ═══════════════════════════════════════════════════════════════
    
    EC2 Instances:    2x t2.micro (✅ FREE - 750 hrs/month)
    EBS Storage:      30GB total  (✅ FREE - 30GB limit)
    VPC & Networking: Standard    (✅ FREE - Always)
    S3 Storage:       < 5GB       (✅ FREE - 5GB limit)
    Data Transfer:    < 100GB     (✅ FREE - 100GB/month)
    
    ��� ESTIMATED MONTHLY COST: $0.00
    
    ⚠️  Keep instances running < 750 hours/month to stay FREE!
    ═══════════════════════════════════════════════════════════════
  EOT
}
