require "./lib/caesar_cipher.rb"

RSpec.describe Cypher do
    before do
        allow($stdout).to receive(:write)
    end

    context "When initialized" do

        describe "#get_message" do
            
            it "Gets message from user" do
                allow_any_instance_of(Cypher).to receive(:gets).and_return("Hi there\n")
                expect(Cypher.new.input_message).to eq("Hi there")
            end
    
            it "Ensures message is a string" do
                allow_any_instance_of(Cypher).to receive(:gets).and_return("Hi there\n")
                expect(Cypher.new.input_message).to be_an_instance_of String
            end
    
            it "Doesn't accept non-ASCII characters" do
                allow_any_instance_of(Cypher).to receive(:gets).and_return("日本人\n", "Hi there\n")
                expect(Cypher.new.input_message).to be_ascii_only
            end
        end

        describe "#get_key" do
            
        end
    end


    # describe "#get_message" do
    #     it "Returns a string" do
    #         
    #     end
    # end

    # describe "#get_key" do
    #     it "Returns an integer" do
    #         expect(subject.get_key()).to be_an_instance_of Integer
    #     end
    # end
end