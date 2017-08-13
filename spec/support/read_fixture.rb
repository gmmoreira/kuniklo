module ReadFixture
  def read_fixture(name, *options)
    dir = File.expand_path('../../fixtures', __FILE__)
    file = File.open("#{dir}/#{name}", *options)
    file.read.tap do
      file.close
    end
  end
end
