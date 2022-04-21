# ALLUSERS have Full Control
resource "aws_s3_bucket" "iac-apsouth1-s3-FullControl" {
  bucket = "iac-apsouth1-s3-FullControl"
 force_destroy=true
 grant {
    type = "Group"
    permissions = ["FULL_CONTROL"]
    uri = "http://acs.amazonaws.com/groups/global/AllUsers"
}
 tags={
   Name = "iac-apsouth1-s3-permissions-FullControl"
 }
  versioning {
    enabled = true
  }
}


# ALLUSERS have read access
resource "aws_s3_bucket" "iac-apsouth1-s3-FullRead" {
  bucket = "iac-apsouth1-s3-FullRead"
    force_destroy=true
 grant {
    type       = "Group"
    permissions = ["READ"]
    uri        = "http://acs.amazonaws.com/groups/global/AllUsers"
  }
tags={
    name="iac-apsouth1-s3-permissions-FullRead"
}
}

# ALLUSERS have write access
resource "aws_s3_bucket" "iac-apsouth1-s3-FullWrite" {
 bucket = "iac-apsouth1-s3-FullWrite"
 force_destroy=true
 grant {
        type = "Group"
        permissions = ["WRITE"]
        uri = "http://acs.amazonaws.com/groups/global/AllUsers"
}
 tags={
   Name = "iac-apsouth1-s3-permissions-FullWrite"
 }
}

# ALLUSERS have read access policy permission
resource "aws_s3_bucket" "iac-apsouth1-s3-Read_ACP" {
  bucket = "iac-apsouth1-s3-Read_ACP"
    force_destroy=true
 grant {
    type       = "Group"
    permissions = ["READ_ACP"]
    uri        = "http://acs.amazonaws.com/groups/global/AllUsers"
  }
 tags={
        name="iac-apsouth1-s3-permissions-ReadACP"
            }
}

# ALLUSERS have write  access policy permission
resource "aws_s3_bucket" "iac-apsouth1-s3-Write_ACP" {
 bucket = "iac-apsouth1-s3-Write_ACP"
 force_destroy=true
 grant {
        type = "Group"
        permissions = ["WRITE_ACP"]
        uri = "http://acs.amazonaws.com/groups/global/AllUsers"
}
 tags={
   Name = "iac-apsouth1-s3-permissions-WriteACP"
 }
}

#Access via publicpolicy
resource "aws_s3_bucket" "iac-apsouth1-s3-ObjectPublicPolicy" {
 bucket = "iac-apsouth1-s3-ObjectPublicPolicy"
 force_destroy=true
 tags={
   Name = "iac-apsouth1-s3-ObjectPublicPolicy"
 }
}

resource "aws_s3_bucket_policy" "iac-apsouth1-s3-bucketpolicy-ObjectPublicPolicy" {
    bucket = aws_s3_bucket.iac-apsouth1-s3-ObjectPublicPolicy.id
    policy = <<EOP
{
    "Version": "2012-10-17",
    "Id": "iac-apsouth1-s3-bucketpolicy-ObjectPublicPolicy",
    "Statement": [
        {
          "Sid": "Stmt1585223961593",
          "Action": [
            "s3:DeleteObject",
            "s3:GetObject",
            "s3:PutObject"
          ],
          "Effect": "Allow",
          "Resource": "arn:aws:s3:::iac-apsouth1-s3-ObjectPublicPolicy/*",
          "Principal": "*"
        }
      ]
    }
EOP
}
