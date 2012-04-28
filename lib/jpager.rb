require "jpager/version"
require "java"

module JPager
  module_function
  def page(pager = 'less')
    pb = java.lang.ProcessBuilder.new(pager)
    pb = pb.redirect_output(java.lang.ProcessBuilder::Redirect::INHERIT)
    process = pb.start
    input = process.output_stream
    input_io = input.to_io
    
    begin  
      yield input
    rescue Exception
    end
    input.close rescue nil
    process.wait_for
  end
end
