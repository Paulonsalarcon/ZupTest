
magaluLogo = "css:.header-logo"
magaluLogoImage = "css:.lu-header-a"
searchInput = "css:input#inpHeaderSearch"
searchButton = "css:span#btnHeaderSearch"

magaluRightHeader = "css:.container-right-top-header"
loginBlock = magaluRightHeader + " .content-login-car"
loginLink = loginBlock + " .login-link"
quantityItems = " .quantity-itens"
favoriteBlock = loginBlock + ".container-wishlist .wish-top-header"
favoriteIcon = favoriteBlock + " .icon-fav"
favoriteCount = favoriteBlock + quantityItems
cartBlock = loginBlock + " .container-checkout  .car-top-header"
cartIcon = cartBlock + " .icon-cart"
cartCount = cartBlock + quantityItems

topLinksBlock = magaluRightHeader + " .container-links-top-header"
myOrdersLink = topLinksBlock + " [href='/acompanhamento/']"


commonPageElements = [magaluLogo,
                      magaluLogoImage,
                      searchInput,
                      searchButton,
                      favoriteIcon,
                      favoriteCount,
                      cartIcon,
                      cartCount,
                      myOrdersLink
                      ]