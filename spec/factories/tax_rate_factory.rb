FactoryGirl.define do
  factory :clothing_tax_rate, class: Spree::TaxRate do
    name 'Tax'
    amount 0.0
    tax_category { Spree::TaxCategory.find_or_create_by(tax_code: 'PC030000') }
    association(:calculator, factory: :avalara_transaction_calculator)
    zone { Spree::Zone.find_or_create_by(name: 'GlobalZone') }
    show_rate_in_label false
  end

  factory :shipping_tax_rate, class: Spree::TaxRate do
    name 'Shipping Tax'
    amount 0.0
    tax_category { create(:tax_category, tax_code: 'FR000000') }
    association(:calculator, factory: :avalara_transaction_calculator)
    zone { Spree::Zone.find_or_create_by(name: 'GlobalZone') }
    show_rate_in_label false
  end
end