class Elemento < ActiveRecord::Base
  belongs_to :tipo_elemento
  belongs_to :estado

  validates :nombre, :presence => true
  validates :codigo_interno, :presence => true
  validates :codigo_contable, :presence => true
  validates :tipo_elemento, :presence => true  
  validates :estado, :presence => true

  def self.search(search, page)
		where(['upper(codigo_interno) like ? or nombre = ?', 
		"%#{search}%".upcase,"#{search}"]).paginate(page: page, per_page: 8).order("id")
	end
end