variable "vpc_id" {
  description = "The VPC ID where the EKS cluster will be created"
  type        =  string
  default     = "vpc-06800d1ec9c8cdf73"
}

variable "subnet_ids" {
  description = "List of subnet IDs in the VPC"
  type        = list(string)  
  default     = [
       "subnet-0066c4f196ce9a406",
       "subnet-09d31b66ab19a17e9",
       "subnet-0ab0cfff9bd77d587"
  ]

}

variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string   # This should be a single string
  default     = "devsecops-eks"  # Provide the cluster name as a string
}