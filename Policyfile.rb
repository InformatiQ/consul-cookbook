name 'consul'
default_source :community
cookbook 'consul', path: '.'
cookbook 'seven_zip', '=3.0.0'
run_list 'consul::default'
