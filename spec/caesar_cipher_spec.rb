require "./lib/caesar_cipher.rb"

RSpec.describe Cypher do
    before do
        allow($stdout).to receive(:write)
    end

    let(:def_string) { "Hi there friend" }

    context "When initialized" do
        

        describe "#get_message" do
            
            it "gets message from user" do
                allow_any_instance_of(Cypher).to receive(:gets).and_return(def_string)
                expect(subject.input_message).to_not be_nil
            end
    
            it "ensures message is a string" do
                allow_any_instance_of(Cypher).to receive(:gets).and_return(def_string)
                expect(subject.input_message).to be_an_instance_of String
            end
    
            it "doesn't accept non-ASCII characters" do
                allow_any_instance_of(Cypher).to receive(:gets).and_return("日本人\n", def_string)
                expect(subject.input_message).to be_ascii_only
            end
        end

        describe "#get_key" do
            it "gets key from user" do
                allow_any_instance_of(Cypher).to receive(:gets).and_return("10")
                expect(subject.key).to_not be_nil
            end

            it "returns an integer" do
                allow_any_instance_of(Cypher).to receive(:gets).and_return("10")
                expect(subject.key).to be_an_instance_of Integer
            end
        end
    end


    context "While ciphering" do

        describe "#to_ascii" do
            it "returns an array" do
                allow_any_instance_of(Cypher).to receive(:gets).and_return(def_string, "10")
                expect(subject.to_ascii("hi")).to be_an_instance_of Array
            end
            
            it "converts to message's ASCII values" do
                allow_any_instance_of(Cypher).to receive(:gets).and_return(def_string, "10")
                expect(subject.to_ascii(subject.input_message)).to eq([72, 105, 32, 116, 104, 101, 114, 101, 32, 102, 114, 105, 101, 110, 100])
            end
        end

        describe "#apply_key" do
            it "returns an array" do
                allow_any_instance_of(Cypher).to receive(:gets).and_return(def_string, "10")
                expect(subject.apply_key([65, 66])).to be_an_instance_of Array
            end

            it "returns an array of eql length to input array" do
                allow_any_instance_of(Cypher).to receive(:gets).and_return(def_string, "10")
                expect(subject.apply_key([65, 66]).length).to eq(2)
            end

            it "adds the key to each value" do
                allow_any_instance_of(Cypher).to receive(:gets).and_return(def_string, "10")
                expect(subject.apply_key([65, 66])).to eq([75, 76])
            end

            it "wraps around when end of alphabet is reached" do
                allow_any_instance_of(Cypher).to receive(:gets).and_return(def_string, "10")
                expect(subject.apply_key([85, 121])).to eq([69, 105])
            end
        end

        describe "#to_string" do
            it "returns a string" do
                allow_any_instance_of(Cypher).to receive(:gets).and_return(def_string, "10")
                expect(subject.to_string([102, 111, 111])).to eq("foo")
            end

            it "returns a string of same length as input array" do
                allow_any_instance_of(Cypher).to receive(:gets).and_return(def_string, "10")
                expect(subject.to_string([102, 112, 113]).length).to eq(3)
            end
        end
    end

    context "result" do
        
        it "wraps around when end of alphabet is reached" do
            allow_any_instance_of(Cypher).to receive(:gets).and_return(def_string, "10")
            
        end
        
        it "maintains case" do
            allow_any_instance_of(Cypher).to receive(:gets).and_return(def_string, "10")
            
        end

        it "returns ciphered message of same length as input message" do
            
        end
    end
end