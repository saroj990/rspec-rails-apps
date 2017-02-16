class Book
 
end

describe Book do
  it 'rspec 3 stub syntax example' do   
    allow(Book).to receive(:rename).and_return(true)    
  end 
end