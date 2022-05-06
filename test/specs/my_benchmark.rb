require 'benchmark/ips'

def compare(hash)
  100000.times do
    hash.values()
    hash.keys()
  end
end

Benchmark.ips do |x|
  x.report("number") {
    user = {
      "email" => "example@example.com",
      "name" => "example"
    }
    compare(user)
  }
  x.report("string") {
    user = {
      1 => "example@example.com",
      2 => "example"
    }
    compare(user)
  }
  x.report("symbol") {
    user = {
      email: "example@example.com",
      name: "example"
    }
    compare(user)
  }
  
  x.compare!
end