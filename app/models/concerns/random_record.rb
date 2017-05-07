module RandomRecord
  def random_ids(number, name)
    ids = []
    model_count = name.constantize.count
    number.times do
      ids << rand(1..model_count)
    end
    return ids
  end
end
