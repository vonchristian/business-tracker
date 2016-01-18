module Date::QuarterRanges
  def first_quarter
    DateTime.current.beginning_of_year.all_quarter
  end

  def second_quarter
    DateTime.current.beginning_of_year.next_month.next_month.next_month.all_quarter
  end

  def third_quarter
    DateTime.current.end_of_year.prev_month.prev_month.prev_month.all_quarter
  end

  def fourth_quarter
    DateTime.current.end_of_year.all_quarter
  end
end
