## RSpec
class Something < Minitest::Test
  def test_works
    assert_equal 11, 10
  end

  def test_really_works
    assert_equal 11, 11
  end
end



# RSpec
describe "something" do
  it "works" do
    expect(10).to equal(11)
  end

  it "really works" do
    expect(11).to equal(11)
  end
end