provider "aws" {
    region = "${var.AWS_REGION}"
    default_tags {
    tags = {
        Owner = "Kumar"
        Email = "kumar@cloudifyops.com"
        Purpose = "Tech Start"
        SchedulerRequired = "No"
        Approver = "Kumar"
        }
    }
}