variable "bucket_name" {
  default = "javahome-dev-2019"
}

variable "common_tags" {
  type = "map"
  default = {
    "businessunit" = "a",
    "investmentid" =  "b",
  }
}

variable "email" {
  type = "map"
  default = {
    "email" = "harish@xyz.com"
}
  }

