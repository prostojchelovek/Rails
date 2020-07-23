class BadgeService
  RULES = %w[category level first_attempt].freeze

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
    @user.received_awards.where(badge: type_of_badge(rule, parameter)).order(created_at: :asc).last.updated_at
  end

  def category(category)
    return unless @test.category.title == category && @test_passage.succesfully?
      if were_badges_issued?('category', category)
        Test.sort_by_category(category).count == @user.tests.succes.sort_by_category(category)
          .after_badge_issue(last_badge_issued('category', category)).uniq.count
      else
        Test.sort_by_category(category).count == @user.tests.success
          .sort_by_category(category).uniq.count
      end
  end

  def first_attempt(invisible_criterion)
    @user.tests.where(id: @test.id).count == 1 if @test_passage.succesfully?
  end

  def level(level)
    return unless @test.level == level.to_i && @test_passage.succesfully?
      if were_badges_issued?('level', level)
        Test.where(level: level.to_i).count == @user.tests.success.where(level: level)
          .after_badge_issue(last_badge_issued('level', level)).uniq.count
      else
        Test.where(level: level.to_i).count == @user.tests.success
          .where(level: level).uniq.count
      end
  end
end
