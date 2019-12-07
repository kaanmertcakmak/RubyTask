Given(/^I visit HepsiBurada homepage site$/) do
  @home_page = HomePage.new # pageElements dosyasında olusturulan HomePage classı çağırılır
  @home_page.load # home page sayfasında navigate edilir
end

When(/^I navigated Login page$/) do

  @home_page.clickonMyAccount # Ana sayfadaki my account butonuna tiklatilir
  @home_page.clickLoginButton # Giriş yap butonuna tiklatilir
  # find("div[id='myAccount']").click
  # find("a[id='login']").click
end

And(/^I enter username and password$/) do
  @dir_to_data = Dir.pwd + '/features/support'
  @data = YAML.load_file("#{@dir_to_data}/data.yml") # support dosyasının içindeki data.yml dosyası yüklenir
  @user_email = @data["DataSet1"]["email"] # kullanıcının mail adresi data.yml dosyasından çekilir
  @user_password = @data["DataSet1"]["password"] # kullanıcının şifresi data.yml dosyasından çekilir
  @login_page = LoginPage.new
  @login_page.enter(# data.yml dosyasından çekilen değerler girilir
      username_field: @user_email,
      password_field: @user_password
  )
  # fill_in 'email', with: 'kaanmertcakmak@gmail.com'
  # fill_in 'password', with: 'kaanmert12'
end

And(/^I click on Login button$/) do
  # find("button[class='btn full btn-login-submit']").click

  @login_page.clickLoginButton # kullanıcı adı ve şifre bir önceki adımda girildikten sonra login olunur
end

Then(/^Hesabım text is displayed$/) do
  # page.should have_xpath("(//a[text()='Hesabım'])[1]")

  expect(@home_page.myAccountFieldText).to eq("Kaan Mert \xC3\x87akmak") # Hesabım kısmındaki text'in kullanıcı adım olan "Kaan Mert Çakmak"a eşit olup olmadığı kontrol edilir. Bu sayede kullanıcının login olup olmadığı anlaşılır
  
end

When(/^I Navigated to Bilgisayar category$/) do

  @home_page.clickonCategoryTab # seçilen kategorinin sekmesine tıklanır
  @home_page.clickSelectedCategory # sekmeye tıklandıktan sonra açılan pencerede seçilecek kategoriye tıklanır
  # find("li[id='elektronik']").click
  # find("a[data-title='Bilgisayar/Tablet']").click
end


Then(/^I get result count of products$/) do
  @selected_category_page = CategoryResultsPage.new
  productCount_text = @selected_category_page.totalCountofProducts # açılan sayfadaki toplam ürün sayısı çekilir
  # value = page.first(".totalItems")

  puts productCount_text
end

When(/^I clicked on first product from product results$/) do

  @selected_category_page.clickOntheFirstProductinResultsPage  # açılan sayfadaki ilk ürüne tıklatılır
end

When(/^I clicked on first product from search results$/) do
  search_results_page = CategoryResultsPage.new
  search_results_page.clickOntheFirstProductinSearchResults  # açılan sayfadaki ilk ürüne tıklatılır
end


And(/^I click on Sepete Ekle button$/) do

  @name_of_product = @selected_category_page.nameOfTheSelectedProduct # tıklanan ürünün ismi alınır
  puts @name_of_product
  find_by_id('addToCart').click # sepete ekle butonuna tıklatılır
end

And(/^I click on Sepetim button$/) do
  @home_page.clickSepetimButton
end

Then(/^Selected product's name is displayed in Sepet$/) do

  @sepetim_page = SepetimPage.new
  @productInSepet = @sepetim_page.nameOfProductInSepet # sepetteki ürünün ismi alınır

  puts @productInSepet
  expect(@productInSepet).to include(@name_of_product) # sepete eklemeden önce alınan isim textiyle sepetin içindeki ürünün isim texti karşılaştırılır. Bu adım, istenen ürünün sepete eklenip eklenmediğini anlamak için yapılır.
  @sepetim_page.clickOnProductInSepet #sepetteki ürüne tıklatılır
  page.has_text?(@name_of_product) #sepete eklemeden önce alınan ürün isminin bu sayfada olup olmadığı kontrol edilir. Doğru ürünün sepete eklenip eklenmediği tekrar kontrol edilmiş olur.
end

And(/^Delete product from Sepet$/) do
  page.go_back
  @sepetim_page.deleteProductInSepet #Test tekrar tekrar koşturulduğunda, sepette hali hazırda aynı ürün olmasın diye testin sonunda sepetteki ürün sepetten çıkartılır
end

When(/^I search some text on the search field$/) do
  @search_text = @data["DataSet1"]["searchText"]
  @home_page.searchSomeText(search_field: @search_text)
  @home_page.clickOnSearchButton
end

When(/^I click on Listeme Ekle button$/) do
  @selected_product_page = CategoryResultsPage.new
  @product_page = SepetimPage.new
  @product_name_about_to_be_list = @selected_product_page.nameOfTheSelectedProduct
  puts @product_name_about_to_be_list
  @product_page.clickOnListemeEkleButton
end

And(/^I click on Daha sonra alacaklarım button$/) do
  @product_page.clickOnDahaSonraAlacaklarimButton
end

And(/^I click on Hesabım button$/) do
  page = HomePage.new
  page.clickonMyAccount
end

And(/^I click on Tum Listelerim button$/) do
  @home_page.clickOnListelerimButton
end

And(/^I click on Daha sonra alacaklarım button again$/) do
  @listelerim_page = ListelerimPage.new
  @listelerim_page.clickOnDahaSonraAlacaklarimField
end

And(/^Selected product's name is displayed in Daha sonra alacaklarım page$/) do
  productInList = @listelerim_page.getProductNameInList
  @listelerim_page.clickOnProductImageInList
  puts productInList
  expect(productInList).to eql(@product_name_about_to_be_list)
end

And(/^Logout$/) do

  @home_page.clickonMyAccount
  @home_page.clickLogoutButton
end