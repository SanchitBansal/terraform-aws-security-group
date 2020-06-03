/**
 * data source to get vpc_id through tags
 */

 data "aws_vpc" "vpc" {
   tags = "${merge(
     map("environment", "${var.environment}"),
     var.vpc_tags)
   }"
 }
