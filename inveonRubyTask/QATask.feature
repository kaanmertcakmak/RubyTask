Feature: Inveon QA Task
  • Ebay sitesine ana sayfa üzerine gidilmesi ve herhangi bir kullanıcı ile login olunması,
  • Ana sayfadan bir kategoriye gidilmesi ve yüklenen ürün sayısının beklenmesi,
  • Arama sonucundan ilk ürünü sepete eklenmesi,

  Background: Login to the proper account
    Given I visit HepsiBurada homepage site
    When I navigated Login page
    And I enter username and password
    And I click on Login button
    Then Hesabım text is displayed

  @InveonTask
  Scenario: Selecting a category and add first product in that category into the account's cart

    When I Navigated to Bilgisayar category
    Then I get result count of products
    When I clicked on first product from product results
    And I click on Sepete Ekle button
    Then Selected product's name is displayed in Sepet
    And Delete product from Sepet
    And Logout




