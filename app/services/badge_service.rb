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

  def type_of_badge(rule, parameter)
    @user.badges.where(rule: rule, parameter: parameter)
  end

  def were_badges_issued?(rule, parameter)
    type_of_badge(rule, parameter).count > 0
  end

  def last_badge_issued(rule, parameter)
    @user.received_awards.where(badge: type_of_badge(rule, parameter)).order(created_at: :asc).last
  end

  def category(category)
    if @test.category.title == category && @test_passage.succesfully?
      if were_badges_issued?('category', category)
        Test.sort_by_category(category).count == @user.test_passages
          .select{ |passed| passed.updated_at > last_badge_issued('category', category).updated_at }
          .select{ |passed| passed.test.category.title == category && passed.succesfully?}.uniq.count
      else
        Test.sort_by_category(category).count == @user
          .test_passages.select{ |passed| passed.test.category.title == category }
          .select{ |passed| passed.succesfully? }.uniq.count
      end
    end
  end

  def first_attempt(invisible_criterion)
    @user.tests.where(id: @test.id).count == 1 if @test_passage.succesfully?
  end

  def level(level)
    if @test.level == level.to_i && @test_passage.succesfully?
      if were_badges_issued?('level', level)
         Test.where(level: level.to_i).count == @user.test_passages
          .select{|passed| passed.updated_at > last_badge_issued('level', level.to_i).updated_at }
          .select{|passed| passed.test.level == level.to_i && passed.succesfully? }
          .uniq.count
      #  byebug
      else
        Test.where(level: level.to_i).count == @user.test_passages
          .select{|passed| passed.test.level == level.to_i && passed.succesfully? }
          .uniq.count
      end
    end
  end
end
