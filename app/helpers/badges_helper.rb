module BadgesHelper
  def rules
    BadgeService::RULES.map { |rule| [t("badge_rules.#{rule}"), rule] }
  end
end
