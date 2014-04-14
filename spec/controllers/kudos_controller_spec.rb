require 'spec_helper'

describe KudosController do
  context "#create" do
    context "when an answer is given" do
      context "when the current user has not given kudos to the answer" do
        it "creates a new kudo"
      end
      context "when the current user has given kudos to the answer" do
        it "does not create a new kudo"
      end
    end
    context "when default params are provided" do
      context "when the current user has not given kudos to the question" do
        it "creates a new kudo"
      end
      context "when the current user has given kudos to the question" do
        it "does not create a new kudo"
      end
    end
  end
end
