cluster_name = "devsecops-eks"
vpc_id       = "vpc-06800d1ec9c8cdf73"
subnet_ids   = ["subnet-0066c4f196ce9a406", "subnet-09d31b66ab19a17e9", "subnet-0ab0cfff9bd77d587"]
variable "region" {
  description = "AWS region"
  type        = string
}

