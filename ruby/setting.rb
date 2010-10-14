# 全局配置， 读的是config/setting中的内容，如需要改变配置请修改setting中内容
class Setting
  cattr_accessor :available_setting 
  cattr_accessor :setting_file_path
  self.setting_file_path = RAILS_ROOT + "/config/setting.yml" 
  self.available_setting = YAML.load(File.read(setting_file_path))
  Rails.logger.debug "setting loaded"

  def self.dump_setting
    File.open(setting_file_path,"w") do |file|
      file << YAML.dump(available_setting)
    end
  end

  def  self.[](name)
    available_setting[name]
  end

  def self.[]=(name, v)
    available_setting[name] = v
    generate_methods(name,v)
  end


  def self.generate_methods(name,params)
    src = <<-END_SRC
  def self.#{name}
  self[:#{name}] || self["#{name}"]
  end

 def self.#{name}?
 self[:#{name}].to_i > 0 || self["#{name}"]
 end

def self.#{name}=(value)
self["#{name}"] = value
end
  END_SRC
  class_eval src, __FILE__, __LINE__

  end
  self.available_setting.each do |name, params|
    generate_methods(name,params)
  end

end
