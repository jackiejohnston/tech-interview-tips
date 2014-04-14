require 'spec_helper'

describe FavoritesController do
  context "#create" do
    context "when the current user has favorited the question" do
      it "favorites the question"
    end
    context "when the current user has not favorited the question" do
      it "does not favorites the question"
    end
  end
end
