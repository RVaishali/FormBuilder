class FormElement < ActiveRecord::Base
  belongs_to :element
  belongs_to :form

  serialize :condition

  def to_show(data_hash)
    element = self.element
    puts "TO SHOW.. #{element.name}.. #{data_hash.inspect}"
    condition = self.condition.try(:[],:to_show)
    puts "CON... #{condition.inspect}"
    show = true
    if(condition.present?)
      show = eval(condition)
    end
    puts "SHOW.. #{show}"
    return show
  end

end
