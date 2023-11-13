variable "alarm_notification_channel" {
  description = "It's a SNS that might send emails, page your Incident Response tool (Pager Duty, OpsGenie, VitorOps, etc)"
  type        = string
}

variable "lambda_names" {
  description = "Lambda function names to create the alarms. `e.g. lambda_names = [\"func_1\", \"func_2\", \"func_3\"]`"
  type        = set(string)
}
