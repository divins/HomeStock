SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
    primary.item :dashboard, I18n.t('menu.dashboard'), user_root_path
  end
end

