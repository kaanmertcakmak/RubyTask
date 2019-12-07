class HomePage < SitePrism::Page

  set_url 'https://www.hepsiburada.com/'
  element :myAccount_field, "div[id='myAccount']"
  element :login_dropdown, "a[id='login']"
  element :username_text, "a[class='login user-name']"
  element :select_category_tab, "li[id='elektronik']"
  element :select_category, "a[data-title='Bilgisayar/Tablet']"
  element :logout_button, "a[class='logout']"
  element :sepetim_button, "a[id='shoppingCart']"
  element :search_field, "input[id='productSearch']"
  element :search_button, "button[id='buttonProductSearch']"
  element :listelerim_button, "a[href='https://listelerim.hepsiburada.com/']"

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

  def clickSepetimButton
    sepetim_button.click
  end

  def searchSomeText(**attrs)
    search_field.set attrs[:search_field]
  end

  def clickOnSearchButton
    search_button.click
  end

  def clickOnListelerimButton
    listelerim_button.click
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

  def clickOntheFirstProductinSearchResults
    page.first("a[data-bind='click: clickHandler.bind($data)']").click
  end

  def clickOntheFirstProduct
    page.first("a[data-bind='click: clickHandler.bind($data)']").click
  end
end

class SepetimPage < SitePrism::Page
  element :product_in_sepet, "h4.product-name>a"
  element :delete_product_in_sepet, "a[class^='btn-delete']"
  element :listeme_ekle_button, :xpath, "//div[text()='Listeme ekle']"
  element :daha_sonra_alacaklarim_button, :xpath, "//span[text()='Daha sonra alacaklarım']"

  def nameOfProductInSepet
    product_in_sepet.text
  end

  def clickOnProductInSepet
    product_in_sepet.click
  end

  def deleteProductInSepet
    delete_product_in_sepet.click
  end

  def clickOnListemeEkleButton
    listeme_ekle_button.click
  end
  def clickOnDahaSonraAlacaklarimButton
    daha_sonra_alacaklarim_button.click
  end

end

class ListelerimPage < SitePrism::Page
  element :daha_sonra_alacaklarim_field, "a[href='/daha-sonra-alacaklarim']"
  element :product_name_in_my_lists, "div[class='product-title']"
  element :product_image_in_my_lists, "div[class='product-image']"

  def clickOnDahaSonraAlacaklarimField
    daha_sonra_alacaklarim_field.click
  end

  def getProductNameInList
    product_name_in_my_lists.text
  end

  def clickOnProductImageInList
    product_image_in_my_lists.click
  end



end
