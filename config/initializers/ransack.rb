Ransack.configure do |config|
  config.add_predicate 'has_institutions',
    :arel_predicate => 'in',
    :formatter => proc {|institution_ids| User.institution_subquery(institution_ids)},
    :validator => proc {|v| v.present?},
    :compounds => true
end