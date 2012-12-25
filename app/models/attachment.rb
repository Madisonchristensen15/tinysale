# == Schema Information
#
# Table name: attachments
#
#  id                :integer          not null, primary key
#  status            :string(255)
#  price_in_cents    :integer
#  product_id        :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  item_file_name    :string(255)
#  item_content_type :string(255)
#  item_file_size    :integer
#  item_updated_at   :datetime
#

class Attachment < ActiveRecord::Base
  attr_accessible :price_in_cents, :status, :item

  belongs_to :product

  has_attached_file :item

  validates :price_in_cents, presence: true, :format => { :with => /^\d+??(?:\.\d{0,2})?$/ }, :numericality => {:greater_than => 0, :less_than => 1000000}

  validates_attachment_presence :item
  validates_attachment_size :item, less_than: 10.megabytes

  before_create :set_status_to_active, :convert_price_to_cents

  private

  def set_status_to_active
    self.status = :active
  end

  def convert_price_to_cents
    self.price_in_cents = price_in_cents.to_f * 100
  end
end
