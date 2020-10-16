hpt = hypertune.HyperTune()
hpt.report_hyperparameter_tuning_metric(
   hyperparameter_metric_tag='mean_absolute_error',
   metric_value=error,
   global_step=1)