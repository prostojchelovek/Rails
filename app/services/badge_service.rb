class BadgeService
  def initialize(test_passage)
    @test_passage = test_passage
    @user = @test_passage.user
    @test = @test_passage.test
  end

  def check_badges
    Badge.all.select do |badge|
      send(badge.rule, badge.parameter)
    end
  end

  def category(category)
    if @test.category.title == category && @test_passage.succesfully?
      Test.sort_by_category(category).count == @user.tests.sort_by_category(category).uniq.count
    end
  end

  def first_attempt(invisible_criterion)
    @user.tests.where(id: @test.id).count == 1 if @test_passage.succesfully?
  end

  def level(level)
    if @test.level == level.to_i && @test_passage.succesfully?
      Test.where(level: level).count == @user.tests.where(level: level).uniq.count
    end
  end
end
