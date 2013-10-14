require "helper"

describe Airbrite::Concerns::Listable do
  context "#list" do
    it "gets the collection_url and maps the data into instances of the class" do
      response = double("response")
      arr = [{:_id => 1}, {:_id => 2}, {:_id => 3}]
      response.should_receive(:data).at_least(:once).and_return(arr)
      Airbrite::Client.instance.should_receive(:get).with(Airbrite::Event.collection_url, {}).and_return(response)
      events = Airbrite::Event.list.data
      events.each do |e|
        e.should be_an_instance_of(Airbrite::Event)
      end
      events.should have(3).items
      events.map(&:_id).should == [1,2,3]
    end
  end
end
