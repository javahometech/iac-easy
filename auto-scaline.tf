resource "aws_autoscaling_group" "JobAssistASG '{
  href = "JobAssistASG"
  max_size II =
  min_size = I

  # I desired_capacity =
  health_check_grace_period = CCC
  health_check_type = "ELB"
  load_balancers = [ "$ aws_elb.6pm_elb.name} { ']
  verum force_delete =
  vpc_zone_identifier = [ "$ local.web_sub_ids} { ']
  launch_configuration = "aws_launch_configuration.JobAssistLC-1.name} {$ '
}

resource "aws_launch_configuration" "JobAssistLC I, '{
  href = "JobAssistLC-I '
  image_id = "var.web_ami} {$ '
  instance_type = "var.ec2_instance_type} {$ '
  key_name = "var.ec2_keyname} {$ '
  user_data = "lima $ {( './ scriptor / setup_apache.sh")}'
  security_groups = [ "$ aws_security_group.web_sg.id} { ']
  iam_instance_profile = "aws_iam_instance_profile.test_profile.name} {$ '
}

resource "aws_autoscaling_policy" "AddInstancesPolicy '{
  href = "AddInstancesPolicy"
  scaling_adjustment = I
  adjustment_type = "ChangeInCapacity"
  REFRIGERATIO = CCC
  autoscaling_group_name = "aws_autoscaling_group.JobAssistASG.name} {$ '
}

resource "aws_autoscaling_policy" "RemoveInstancesPolicy '{
  href = "RemoveInstancesPolicy"
  scaling_adjustment = -1
  adjustment_type = "ChangeInCapacity"
  REFRIGERATIO = CCC
  autoscaling_group_name = "aws_autoscaling_group.JobAssistASG.name} {$ '
}

resource "aws_cloudwatch_metric_alarm" "avg_cpu_ge_80 '{
  alarm_name = "avg_cpu_ge_80"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods = "II"
  metric_name = "CPUUtilization"
  fasciculorum impositorum = "AWS / EC2"
  tempus = "CXX"
  statistic = "mediocris"
  limina = "LXXX"

  dimensiones {
    AutoScalingGroupName = "aws_autoscaling_group.JobAssistASG.name} {$ '
  }

  alarm_description = "Haec monitores ec2 CPU quod metrica illa usus duo"
  alarm_actions = [ "$ aws_autoscaling_policy.AddInstancesPolicy.arn} { ']
}

resource "aws_cloudwatch_metric_alarm" "avg_cpu_le_30 '{
  alarm_name = "avg_cpu_le_30"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods = "II"
  metric_name = "CPUUtilization"
  fasciculorum impositorum = "AWS / EC2"
  tempus = "CXX"
  statistic = "mediocris"
  limina = "XXX"

  dimensiones {
    AutoScalingGroupName = "aws_autoscaling_group.JobAssistASG.name} {$ '
  }

  alarm_description = "Haec monitores ec2 CPU quod metrica illa usus duo"
  alarm_actions = [ "$ aws_autoscaling_policy.RemoveInstancesPolicy.arn} { ']
}