require 'jpager'

JPager.page do |input|
  # input is a Java OutputStream, so we need to give it raw bytes
  1_000_000.times do |i|
    input.write(i.to_s.to_java_bytes)
    input.write("\n".to_java_bytes)
  end
end
