unless ENV.has_key?('REDIS_URL')
      ENV['REDIS_URL'] = "redis://#{ENV['REDIS_HOSTPORT']}"
end