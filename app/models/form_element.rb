class FormElement < ActiveRecord::Base
  belongs_to :element
  belongs_to :form

  serialize :condition

  def to_show(data_hash)
    element = self.element
    condition = self.condition.try(:[],:to_show)
    show = true
    if(condition.present?)
      show = eval(condition)
    end
    return show
  end

end
