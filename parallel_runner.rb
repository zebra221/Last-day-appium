require 'concurrent'

device_array = []
devices = `adb devices`
devices.gsub!('List of devices attached', '').gsub!("\n", '')
device_id_array = devices.split("\tdevice")
device_id_array.each_with_index do |device, index|
  device_array.push(device_id: device, appium_port: 4723 + index, system_ports: 8200 + index )
end

pool = Concurrent::FixedThreadPool.new(device_array.length)

device_array.each do |device|
  pool.post do
    pid = spawn "appium -p #{device[:appium_port]}"
    Process.detach(pid)
    sleep(5)
    system "bundle exec cucumber DEVICE_NAME=#{device[:device_id]} APPIUM_PORT=#{device[:appium_port]} SYSTEM_PORT=#{device[:system_ports]} --format pretty --expand --format html -o #{device[:device_id]}.html"
  end
end

pool.shutdown
pool.wait_for_termination

`pkill -f "appium"`