require "./lib/caesar_cipher.rb"

RSpec.describe Cypher do
    before do
        allow($stdout).to receive(:write)
    end

    let(:def_string) { "Hi there friend" }

    context "When initialized" do
        

        describe "#get_message" do
            
            it "Gets message from user" do
                allow_any_instance_of(Cypher).to receive(:gets).and_return(def_string)
                expect(subject.input_message).to_not be_nil
            end
    
            it "Ensures message is a string" do
                allow_any_instance_of(Cypher).to receive(:gets).and_return(def_string)
                expect(subject.input_message).to be_an_instance_of String
            end
    
            it "Doesn't accept non-ASCII characters" do
                allow_any_instance_of(Cypher).to receive(:gets).and_return("日本人\n", def_string)
                expect(subject.input_message).to be_ascii_only
            end
        end

        describe "#get_key" do
            it "Gets key from user" do
                allow_any_instance_of(Cypher).to receive(:gets).and_return("10")
                expect(subject.key).to_not be_nil
            end

            it "Returns an integer" do
                allow_any_instance_of(Cypher).to receive(:gets).and_return("10")
                expect(subject.key).to be_an_instance_of Integer
            end
        end
    end


    context "While ciphering" do

        describe "#to_ascii" do
            it "Returns an array" do
                allow_any_instance_of(Cypher).to receive(:gets).and_return(def_string, "10")
                expect(subject.to_ascii("hi")).to be_an_instance_of Array
            end
            
            it "Of message's ASCII values" do
                allow_any_instance_of(Cypher).to receive(:gets).and_return(def_string, "10")
                expect(subject.to_ascii(subject.input_message)).to eq([72, 105, 32, 116, 104, 101, 114, 101, 32, 102, 114, 105, 101, 110, 100])
            end
        end
    end
end