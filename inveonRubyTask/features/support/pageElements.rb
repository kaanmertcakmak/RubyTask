class HomePage < SitePrism::Page

  set_url 'https://www.hepsiburada.com/'
  element :myAccount_field, "div[id='myAccount']"
  element :login_dropdown, "a[id='login']"
  element :username_text, "a[class='login user-name']"
  element :select_category_tab, "li[id='elektronik']"
  element :select_category, "a[data-title='Bilgisayar/Tablet']"
  element :logout_button, "a[class='logout']"

  def clickonMyAccount
    myAccount_field.click
  end

  def clickLoginButton
    login_dropdown.click
  end

  def myAccountFieldText
    username_text.text
  end

  def clickonCategoryTab
    select_category_tab.click
  end

  def clickSelectedCategory
    select_category.click
  end

  def clickLogoutButton
    logout_button.click
  end
end

class LoginPage < SitePrism::Page
  element :username_field, "[id='email']"
  element :password_field, "[id='password']"
  element :login_button, "button[class='btn full btn-login-submit']"

  def enter(**attrs)
    username_field.set attrs[:username_field]
    password_field.set attrs[:password_field]
  end

  def clickLoginButton
    login_button.click
  end
end

class CategoryResultsPage < SitePrism::Page

  element :selected_product_name, "h1[id='product-name']"

  def totalCountofProducts
    value = page.first('.totalItems')
    value.text
  end

  def nameOfTheSelectedProduct
    selected_product_name.text
  end

  def clickOntheFirstProductinResultsPage
    page.first("a[data-bind='click: clickHandler.bind($data)']").click
  end

  def clickOntheFirstProduct
    page.first("a[data-bind='click: clickHandler.bind($data)']").click
  end
end

class SepetimPage < SitePrism::Page
  element :product_in_sepet, "h4.product-name>a"
  element :delete_product_in_sepet, "a[class^='btn-delete']"

  def nameOfProductInSepet
    product_in_sepet.text
  end

  def clickOnProductInSepet
    product_in_sepet.click
  end

  def deleteProductInSepet
    delete_product_in_sepet.click
  end
end