feature 'there is an alert if the discount code is not successful' do
  scenario 'there is no alert when the page is first loaded' do
    visit '/'
    expect(page).not_to have_content('Discount Voucher has not been successful - try again!')
  end

  scenario 'there is an alert when the page the code is incorrect' do
    visit '/'
    click_button('add_to_cart(Flip Flops, Red)')
    fill_in 'discount_code', with: "wrong code"
    click_button('discount_code_submit')
    expect(page).to have_content('Invaild discount code entered - try again!')
  end

  scenario 'there is no alert when a vaild code is entered' do
    visit '/'
    click_button('add_to_cart(Flip Flops, Red)')
    fill_in 'discount_code', with: "5poundsoff"
    click_button('discount_code_submit')
    expect(page).not_to have_content('Invaild discount code entered - try again!')
  end
end
