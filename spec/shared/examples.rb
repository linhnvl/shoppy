shared_examples :presence_of do |parameter|
  it{is_expected.to validate_presence_of(parameter)}
end

shared_examples :validate_numericality_of do |parameter|
  it{is_expected.to validate_numericality_of(parameter).is_greater_than_or_equal_to(0)}
end

shared_examples :have_many do |parameter|
  it{is_expected.to have_many(parameter).dependent :destroy}
end

shared_examples :belong_to do |parameter|
  it{is_expected.to belong_to(parameter)}
end

shared_examples :have_many_through do |parameter1, parameter2|
  it{is_expected.to have_many(parameter1).through(parameter2).dependent(:destroy)}
end

shared_examples :allow_value do |parameter1, parameter2|
  it{is_expected.to allow_value(parameter1).for parameter2}
end

shared_examples :validate_uniqueness_of do |parameter|
  it{is_expected.to validate_uniqueness_of(parameter)}
end
