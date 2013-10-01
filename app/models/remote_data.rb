class RemoteData < ActiveRecord::Base

  belongs_to :product

  after_create :make_default



  def make_default
    product.remote_datas.map do |remote_data|
      remote_data.update_column(:default, false) unless remote_data == self
    end
    self.update_column(:default, true)
  end
end
