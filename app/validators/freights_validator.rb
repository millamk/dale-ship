class FreightsValidator < ActiveModel::Validator
  def validate(record)
    if record.expire_date < DateTime.now.to_date
      record.errors[:expire_date] << "is invalid"
    end
  end
end
