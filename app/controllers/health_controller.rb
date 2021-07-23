class HealthController < ApplicationController
  def index
    begin
      Timeout::timeout(4) do
        health = {
          database: database_ok?,
          redis: redis_ok?,
        }
        Rails.logger.info(health)
        render json: health, status: health.values.all? ? 200 : 503
      end
      rescue Timeout::Error
        render json: {}, status: 503
      end
  end

  private

  def database_ok?
    ActiveRecord::Base.establish_connection
    ActiveRecord::Base.connection
    ActiveRecord::Base.connected? ? true : false
  end

  def redis_ok?
    $redis.ping == "PONG"
  end
end