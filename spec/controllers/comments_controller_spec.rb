require 'spec_helper'

describe CommentsController do
  let(:fake_comment){FactoryGirl.create(:comment)}
  let(:fake_question){FactoryGirl.create(:question)}

  context "show" do
    before(:each) { get :show, id: fake_comment.id }
    it "assigns fake_comment to a variable" do
      expect(assigns(:comment)).to eq fake_comment
    end

    it "renders fake_comment to json" do
      @comment = { comment: assigns(:comment) }.to_json
      expect(response.body).to eq @comment
    end
  end

  context "new" do
    before(:each) { get :new, id: fake_comment.id }
    it "renders comment to json" do
      @comment = { comment: assigns(:comment) }.to_json
      expect(response.body).to eq @comment
    end
  end

  context "destroy" do
    before(:each) { get :show, id: fake_comment.id }
    it "does not include comment in body" do
      # p @comment
      (response.body).should_not include @comment
    end

    it "doesn't redirect if comment is not deleted correctly" do
      p fake_comment
      p "$" * 100
      p Comment.count
      p fake_comment.id
      expect{
          delete :destroy, id: fake_comment.id, comment: fake_comment
          }.not_to redirect_to("/")
          # seperate test response.status.should be(200)
    end
  end

end
#   render_views
#   context "#show" do
#     before(:each) do
#       @user = User.create(:id => '1', :provider => 'github', :uid => '1234567', :name => 'johnsmith', :email => 'mailme@gmail.com')
#       @question = Question.create(:id => '2', :title => "Who will command the mothership?", :user_id => '1')
#       @answer = Answer.create(:content => "Around the wooorld", :question_id => '2'),
#       @comments = Comment.create(:content => "Aloha HAWAII!", :user_id => '1')
#     end

#     it "is successful" do
#       expect(response).to be_success
#     end

#     it "renders the comments partial" do
#       get :show
#       # render "questions/show", locals: { answer: @answer }
#       # view.should render_template(:partial => "_show")
#       expect(response).to be_success
#     end
#   end

#   context "#new" do
#     it "is successful" do
#       get :new
#       expect(response).to be_success
#     end
#   end

# end
