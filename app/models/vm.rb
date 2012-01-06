class Vm
  include ActiveModel::Serialization
 
  attr_accessor :name , :ram , :disk
  
  def initialize(args)
    @name = args[:name]
    @ram = args[:ram]
    @disk = args[:disk]
  end
  
  def attributes
    {'name' => name ,
      'ram' => ram ,
      'disk' => disk }
  end

end

