data "aws_s3_object" "rules" {
  count  = var.load_from_s3 ? 1 : 0
  bucket = var.s3_bucket
  key    = var.s3_key
}
