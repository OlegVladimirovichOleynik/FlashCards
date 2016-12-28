class SuperMemo
  def calculation(text, typos, repeat, efactor)
    quality = find_quality(text, typos)
    if quality > 2
      new_efactor = find_efactor(efactor, quality)
      interval = find_interval(repeat, efactor)
      repeat += 1
      { review_date: interval.days.from_now, repeat: repeat, efactor: new_efactor }
    else
      { review_date: 1.days.from_now, repeat: 1 }
    end
  end

  private

  def find_interval(repeat, efactor)
    return 6 if repeat == 1
    (repeat * efactor).round
  end

  def find_efactor(efactor, quality)
    efactor + (0.1 - (5 - quality) * (0.08 + (5 - quality) * 0.02))
    [efactor, 1.3].max
  end

  def find_quality(_text, typos)
    if typos == 0 then 5
    elsif typos == 1 then 3
    else 0
    end
  end
end
