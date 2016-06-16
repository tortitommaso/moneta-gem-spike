require_relative '../lib/moneta_spike'
require 'byebug'

describe MonetaSpike do
  let(:external_system) { double("external_system") }
  let(:moneta_spike) { MonetaSpike.new(external_system) }
  let(:store_directory_path) { "/tmp/moneta-gem-spike" }

  before(:each) do
    FileUtils.rm_rf(store_directory_path)
  end

  it "should call external system only once" do
    expect(Dir["#{store_directory_path}/*"].empty?).to be true    

    expect(external_system).to receive(:do_something).once.and_return(1)
    
    expect(moneta_spike.do_something("params")).to eq 1
    expect(moneta_spike.do_something("params")).to eq 1
    
    expect(Dir["#{store_directory_path}/*"].empty?).to be false 
  end

end