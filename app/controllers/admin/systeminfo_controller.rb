class Admin::SysteminfoController < Admin::BaseController
    before_filter :chito_admin_authorize    

  def index
    @system_info = []
    @system_info << {"System Time" => Time.now.to_s(:db_short)}
    @system_info << {"Host name" => %x[uname -a]}
    @system_info << {"Uptime" => %x[uptime]}
    @system_info << {"Date" => %x[date]}
    @system_info << {"Memory" => %x[free]}
    @system_info << {"Disk usage" => %x[df -h]}
    @system_info << {"Lats login" => %x[last |grep pts]}

    @rails_info = []
    @rails_info << {"Ruby version" => RUBY_DESCRIPTION}
    @rails_info << {"RubyGems version" => Gem::VERSION}
    @rails_info << {"RubyGems path" => Gem.path}
    @rails_info << {"Bundler version" => Bundler::VERSION}
    @rails_info << {"Rack version" => Rack.version}
    @rails_info << {"Rails version" => Rails.version}
    @rails_info << {"Application root" => Rails.root.to_s}
    @rails_info << {"Rails environment" => Rails.env}
    @rails_info << {"Encoding external" => Encoding.default_external}
    @rails_info << {"Encoding internal" => Encoding.default_internal}
    #@rails_info << {"Bundle list" => %x[bundle list]}
  end
end
