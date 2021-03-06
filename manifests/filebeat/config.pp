# Filebeat config
class beats::filebeat::config inherits beats::filebeat {
  beats::common::headers {'filebeat':}
  concat::fragment {'filebeat.header':
    target  => '/etc/filebeat/filebeat.yml',
    content => template('beats/filebeat/filebeat.yml.erb'),
    order   => 05,
  }
  # We read them again to combine the variables defined at different levels
  $real_settings = deep_merge(
    $beats::filebeat::prospectors,
    hiera_hash('beats::filebeat::prospectors', {})
  )
  if $real_settings {
    create_resources('beats::filebeat::prospector', $real_settings)
  }
}
