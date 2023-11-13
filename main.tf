resource "aws_cloudwatch_metric_alarm" "lambda_errors" {
  for_each = var.lambda_names

  ## metric
  namespace   = "AWS/Lambda"
  metric_name = "Errors"
  dimensions = {
    FunctionName = each.value
    Resource = each.value
  }
  period = 300

  ## condictions
  comparison_operator = "GreaterThanOrEqualToThreshold"
  statistic           = "Sum"
  threshold           = 1
  evaluation_periods  = 2

  ## alarm 
  alarm_name        = "${each.value}-lambda-error"
  alarm_description = "Lambda Function ${each.value} is having more than 1 Error in 5 minutes. Normal is 0."
  actions_enabled   = "true"
  alarm_actions     = [var.alarm_notification_channel]
  ok_actions        = [var.alarm_notification_channel]

  tags = {
    developed = "VioletX.com"
    terraform = "true"
  }
}
