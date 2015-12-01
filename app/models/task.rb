class Task
  attr_reader :title, :description, :id, :date

  def initialize(data)
    @id = data["id"]
    @description = data["description"]
    @title = data["title"]
    @date= data["date"]
  end

  

end
