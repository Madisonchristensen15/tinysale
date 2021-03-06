describe ApplicationHelper do
  describe "#title" do
    context "when there is no product" do
      it "returns tinysale as the title" do
        title(nil).should == "tinysale"
      end
    end
    context "when there is a product present" do
      it "returns the product title" do
        product = FactoryGirl.build :product
        title(product).should == "My Book"
      end
    end
  end

  describe "#image_for" do
    context "when the user has NOT uploaded an avatar" do
      it "returns an image tag with the gravatar url" do
        user = FactoryGirl.build :user
        image_for(user).should =~ /https:\/\/secure.gravatar.com\/avatar/
      end
    end
    context "when the user uploaded an avatar" do
      it "returns the local image url" do
        user = FactoryGirl.build :user, avatar: File.new(Rails.root + 'spec/factories/images/rails.png')
        image_for(user).should =~ /\/system\/users\/avatars\/\/original\/rails.png?/
      end
    end
  end

  describe "#gravator_for" do
    it "returns the image tag with the user's gravatar" do
      gravatar_for('nmurashev@gmail.com').should == "<img alt=\"user image\" class=\"avatar\" src=\"https://secure.gravatar.com/avatar/ef80d15dc032d1c0adf9547c5dd333b6?d=https://s3.amazonaws.com/tinysale/mrdefault.png\" />"
    end
  end

end