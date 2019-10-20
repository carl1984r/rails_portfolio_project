class Bizlist < ApplicationRecord

  belongs_to :user
  has_many :bizlist_businesses
  has_many :businesses, through: :bizlist_businesses

  validates :name, presence: true

  def add_to
  end

  def remove_from
  end

  def self.verify_presence(bizlist, param)
    !!Business.find_by(id: param) && !bizlist.businesses.find_by(id: param)
  end

  def remove_biz(bizlist, param)
    join = bizlist.bizlist_businesses.find_by(business_id: param)
    join.delete
  end

  def delete_bizlist(bizlist)
    bizlist.bizlist_businesses.each {|x| x.delete} unless bizlist.bizlist_businesses.empty?
    bizlist.destroy
  end

end
