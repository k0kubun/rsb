class SimpleBenchController < ApplicationController
  def static
    render :plain => "Static Text"
  end

  def mandelbrot
    z0 = Complex(params["x"].to_f, params["i"].to_f)
    z = z0
    80.times { z = z * z0 }
    render :plain => (z.abs <= 2.0 ? "in" : "out")
  end

  def db
    # TBD
    render :plain => "For now, static"
  end

  def fivehundred
    raise "This gives an error!"
  end

  def delay
    t = params[:time].to_f || 0.001
    sleep t
    render :plain => "Static Text"
  end

  # Keep in mind that this route only does what you think for single-process setups,
  # not anything with workers and a master process.
  def shutdown
    exit 0
  end

  # If you have the get_process_mem gem available (currently commented out in Gemfile) then this
  # will allow you to get the memory usage.
  def process_mem
    mem = GetProcessMem.new
    render :plain => "Process memory in bytes: #{mem.bytes.to_i}"
  end
end
