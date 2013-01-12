require 'spec_helper'

describe ProductsController do

  describe "index" do
    before do
      get "index"
    end
    it "returns a success response" do
      response.should be_success
    end
    it "renders the index page successfully" do
      response.should render_template "index"
    end
  end

  describe "show" do
    before do
      Attachment.any_instance.stub(:save_attached_files).and_return(true)
      @product = FactoryGirl.create :product
      get "show", id: @product.permalink
    end
    it "returns a success response" do
      response.should be_success
    end
    it "renders the show page successfully" do
      response.should render_template "show"
    end
  end

  describe "new" do
    before do
      sign_in FactoryGirl.create :user
      get 'new'
    end
    it "returns a success response" do
      response.should be_success
    end
    it "renders the new page successfully" do
      response.should render_template "new"
    end
  end

  describe "create" do
    before do
      sign_in FactoryGirl.create :user
      Attachment.any_instance.stub(:save_attached_files).and_return(true)
      @product = FactoryGirl.build :product
      post 'create', product: @product
    end
    it "successfully creates the product" do
      response.should be_success
    end
  end

  describe "edit" do
    before do
      sign_in FactoryGirl.create :user
      Attachment.any_instance.stub(:save_attached_files).and_return(true)
      @product = FactoryGirl.create :product
      get 'edit', id: @product.permalink
    end
    it "returns a success response" do
      response.should be_success
    end
    it "renders the edit page successfully" do
      response.should render_template "edit"
    end
  end

  describe "update" do
    before do
      sign_in FactoryGirl.create :user
      Attachment.any_instance.stub(:save_attached_files).and_return(true)
      @product = FactoryGirl.create :product
      @product.title = "my other book"
      put 'update', id: @product.permalink
    end
    it "successfully updates the product" do
      response.should be_true
      @product.title.should == "my other book"
    end
  end

  describe "destroy" do
    before do
      sign_in FactoryGirl.create :user
      Attachment.any_instance.stub(:save_attached_files).and_return(true)
      @product = FactoryGirl.create :product
      put 'destroy', id: @product.permalink
    end
    it "successfully updates the product" do
      response.should be_true
      expect { Product.find(@product.id)}.to raise_error ActiveRecord::RecordNotFound
    end
  end

  describe "charge" do
    before do
      Attachment.any_instance.stub(:save_attached_files).and_return(true)
      @product = FactoryGirl.create :product, attachments: [(FactoryGirl.create :attachment)]
      User.any_instance.stub_chain(:payment, :access_token).and_return(123)
      Stripe::Charge.stub(:create).and_return(true)
    end
    context "when the charge is successful" do
      it "downloads the attachment" do
        get 'charge', id: @product.id
        response.should redirect_to attachment_path(Attachment.last)
      end
    end
  end

end
